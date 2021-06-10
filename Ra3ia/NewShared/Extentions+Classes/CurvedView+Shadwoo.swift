//
//  CurvedView+Shadwoo.swift
//  Ra3ia
//
//  Created bySara Mady on 3/21/21.
//

import UIKit

extension UIView {
    
   
    
    func addCornersShadow(){
        
        layer.cornerRadius = 20
        clipsToBounds = false
        layer.borderWidth = 0.2
        
        layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner ,  .layerMinXMaxYCorner , .layerMinXMinYCorner]
                
        
        
        layer.shadowColor = UIColor.darkGray.cgColor
        
        layer.shadowOffset = CGSize(width: 20 , height: 120 )
        
        //layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 5.0
        
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds , cornerRadius: 10 ).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        

    }

    
    
    
       func addTopLeftCoreners (num : CGFloat ) {
           
          layer.cornerRadius = num
          layer.maskedCorners = [.layerMaxXMinYCorner , .layerMinXMinYCorner]
           
       }

    
   
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
      }
    
    
    func addRoundedshadwo () {
   layer.cornerRadius = 12
   layer.masksToBounds = true;

      // backgroundColor = UIColor.white
       layer.shadowColor = UIColor.lightGray.cgColor
       layer.shadowOpacity = 0.8
       layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
      layer.shadowRadius = 6.0
       layer.masksToBounds = false
    }
}
