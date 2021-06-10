//
//  TopRight+LeftCorners.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit
extension UIButton {
    
    
    func AddTOPCorners (num : CGFloat ) {
            
      layer.cornerRadius = num
      layer.maskedCorners = [.layerMaxXMinYCorner , .layerMinXMinYCorner]
         
    }
}
