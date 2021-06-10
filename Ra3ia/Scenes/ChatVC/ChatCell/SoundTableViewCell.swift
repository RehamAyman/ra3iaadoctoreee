//
//  SoundTableViewCell.swift
//  BeepBeep
//
//  Created by Sara Ashraf on 12/26/18.
//  Copyright © 2018 Sara Ashraf. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class SoundTableViewCell: UITableViewCell ,SoundCellView{
  
    @IBOutlet weak var finalTimeLabel: UILabel!
    @IBOutlet weak var UserAvatar: UIImageView!
    @IBOutlet weak var secoundAvatat: UIImageView!
    @IBOutlet weak var PlayTimeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var playerView: PlayerViewClass!
    
    
    
    var toogleAction : (()->())?
    var isFinished = false
   
    @IBAction func playButtonAction(_ sender: Any) {
        toogleAction?()
    }
    
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        if playerView.player?.status == .readyToPlay && playerView.player?.rate != 0{
            self.playerView.player?.seek(to: CMTime(seconds: Double(sender.value), preferredTimescale: CMTimeScale.max), completionHandler: { (s) in
            })
        }
        
    }
    func setImage(image: String, bool: Int) {
        if(bool == 1){
            self.UserAvatar.isHidden = false
            self.UserAvatar.setImageWith(image)
            self.secoundAvatat.isHidden = true
           
          
            self.layoutIfNeeded()
        }else{
            self.secoundAvatat.isHidden = false
            self.secoundAvatat.setImageWith(image)
            self.UserAvatar.isHidden = true
          
            self.layoutIfNeeded()
            
        }
    }
    
    func setContent(msg: String) {
        let videoUrl = NSURL(string: msg)
        let avPlayer = AVPlayer(url: videoUrl! as URL)
        self.playerView.playerLayer.player = avPlayer
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        slider.value = 0
        playButton.setImage(#imageLiteral(resourceName: "play-button"), for: UIControl.State.normal)
        PlayTimeLabel.text = "00:00"
        finalTimeLabel.text = "00:00"
    }
    
    
    
    func updateVideoPlayerSlider() {
        // 1 . Guard got compile error because `videoPlayer.currentTime()` not returning an optional. So no just remove that.
        let currentTimeInSeconds = CMTimeGetSeconds((playerView.player?.currentTime())!)
        // 2 Alternatively, you could able to get current time from `currentItem` - videoPlayer.currentItem.duration
        
        let mins = currentTimeInSeconds / 60
        let secs = currentTimeInSeconds.truncatingRemainder(dividingBy: 60)
        let timeformatter = NumberFormatter()
        timeformatter.minimumIntegerDigits = 2
        timeformatter.minimumFractionDigits = 0
        timeformatter.roundingMode = .down
        guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value: secs)) else {
            return
        }
        PlayTimeLabel.text = "\(minsStr):\(secsStr)"
        slider.value = Float(currentTimeInSeconds) // I don't think this is correct to show current progress, however, this update will fix the compile error
        
        // 3 My suggestion is probably to show current progress properly
        if let currentItem = playerView.player?.currentItem {
            let duration = currentItem.duration
            //put all time to the final label
            if !CMTimeGetSeconds(duration).isNaN{
                let mins = Int(CMTimeGetSeconds(duration)) / 60
                let secs = (CMTimeGetSeconds(duration)).truncatingRemainder(dividingBy: 60)
                let timeformatter = NumberFormatter()
                timeformatter.minimumIntegerDigits = 2
                timeformatter.minimumFractionDigits = 0
                timeformatter.roundingMode = .down
                guard let minsStr = timeformatter.string(from: NSNumber(value: mins)), let secsStr = timeformatter.string(from: NSNumber(value: secs)) else {
                    return
                }
                finalTimeLabel.text = "\(minsStr):\(secsStr)"
                //set slider max
                
                self.slider.maximumValue = Float(CMTimeGetSeconds(duration))
                //                print(self.slider.maximumValue)
                if (CMTIME_IS_INVALID(duration)) {
                    // Do sth
                    return;
                }
                let currentTime = currentItem.currentTime()
                slider.value = Float(CMTimeGetSeconds(currentTime))
                //                / CMTimeGetSeconds(duration))
                
                //if video finished
                if currentTime == duration || (finalTimeLabel.text == PlayTimeLabel.text){
                    self.isFinished = true
                }
                
            }
        }
        
    }
    
}
