//
//  PlayerViewClass.swift
//  BeepBeep
//
//  Created by Sara Ashraf on 12/27/18.
//  Copyright © 2018 Sara Ashraf. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class PlayerViewClass: UIView {
    
    override static var layerClass: AnyClass{
        return AVPlayerLayer.self
    }
    
    var playerLayer: AVPlayerLayer{
        return layer as! AVPlayerLayer
    }
    
    var player : AVPlayer?{
        get{
            return playerLayer.player
        }
        set{
            playerLayer.player = newValue
        }
    }
}
