//
//  CGFloatExtension.swift
//  TaxiAwamerCaptain
//
//   Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import UIKit

extension CGFloat {
    
    var responsive: CGFloat {
        var deltaSize : CGFloat = 0
        
        switch (UIDevice.deviceType) {
        case .iPhone4_4s, .iPhone5_5s :
            deltaSize = -1
        case .iPhone6_6s, .iPhone6p_6ps :
            deltaSize = 2
        default:
            deltaSize = 0
        }
        
        return self + deltaSize;
    }
    
}
