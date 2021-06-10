//
//  ChatView+UITableView.swift
//  SeaTrips
//
//  Created by Sara Mady on 03/12/2020.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//

import Foundation
import UIKit
import CoreMedia

extension ChatViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Prisnter.getMessagesnCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCellTableViewCell", for: indexPath) as! ChatCellTableViewCell
        let imageCell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath) as! ImageTableViewCell
        let soundCell = tableView.dequeueReusableCell(withIdentifier: "SoundTableViewCell", for: indexPath) as! SoundTableViewCell
        
        cell.selectionStyle = .none
        imageCell.selectionStyle = .none
        soundCell.selectionStyle = .none

        switch Prisnter.getCurrentTypeCell(index: indexPath.section) {
        case "text":
            Prisnter.CellConfigeration(cell: cell, for: indexPath.section)

            return cell
        case "map":
            imageCell.markerImage.isHidden = false
            imageCell.addressLabel.isHidden = false
            Prisnter.MapCellConfigeration(cell: imageCell, for: indexPath.section)

            return imageCell
        case "image":
            imageCell.markerImage.isHidden = true
            imageCell.addressLabel.isHidden = true
            Prisnter.ImageCellConfigeration(cell: imageCell, for: indexPath.section)
            return imageCell
        case "sound":
            Prisnter.SoundCellConfigeration(cell: soundCell, for: indexPath.section)
            soundCell.toogleAction = {
                
                if soundCell.playButton.imageView?.image == #imageLiteral(resourceName: "play-button"){
                    if  soundCell.playerView.player?.status == .readyToPlay{
                        soundCell.playerView.player?.play()
                        soundCell.isFinished = false
                        if soundCell.isFinished == true{
                            print("seek")
                            soundCell.playerView.player?.seek(to: CMTime(seconds: 0.0, preferredTimescale: CMTimeScale.max))
                        }
                        //  cell.toogleButton.setTitle("Stop", for: UIControlState.normal)
                        soundCell.playButton.setImage(#imageLiteral(resourceName: "pause"), for: UIControl.State.normal)
                        _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { (t) in
                            if soundCell.playButton.imageView?.image == #imageLiteral(resourceName: "pause"){
                                if soundCell.playerView.player?.status == .readyToPlay{
                                    soundCell.updateVideoPlayerSlider()
                                }
                            }
                            //if video finished stop timer
                            if soundCell.isFinished{
                                //stop timer
                                print("stop here")
                                //                            cell.toogleButton.setTitle("Play", for: UIControlState.normal)
                                soundCell.playButton.setImage(#imageLiteral(resourceName: "play-button"), for: UIControl.State.normal)
                                soundCell.slider.value = 0.0
                                soundCell.playerView.player?.seek(to: CMTime(seconds: 0.0, preferredTimescale: CMTimeScale.max))
                                soundCell.playerView.player?.pause()
                                soundCell.PlayTimeLabel.text = "00:00"
                                soundCell.isFinished = false
                                t.invalidate()
                            }
                        })
                    }
                }else if soundCell.playButton.imageView?.image == #imageLiteral(resourceName: "pause"){
                    soundCell.playerView.player?.pause()
                    //                cell.toogleButton.setTitle("Play", for: UIControlState.normal)
                    soundCell.playButton.setImage(#imageLiteral(resourceName: "play-button"), for: UIControl.State.normal)
                }
            }
            return soundCell
        default:
            return cell
        }
       
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
    
    func setupTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
}
