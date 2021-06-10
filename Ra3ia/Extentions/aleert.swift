//
//  aleert.swift
//  Ra3ia
//
//  Created by Sara Mady on 27/05/2021.
//

import Foundation


import UIKit

extension UIAlertController {
    
    
    
    func customAlert (title : String , message : String) {
        view.maskToBounds = true
       
        view.tintColor = UIColor(named: "BaseColour")
        view.backgroundColor = #colorLiteral(red: 0.8728941083, green: 0.7903078794, blue: 0.6347703934, alpha: 1)
      
//        view.borderWidth = 2
//        view.borderColor = UIColor(named: "BaseColour")
        view.cornerRadius = 20
        
        
        
      
        
        
        // change alert font
        
        
        
        let titleFont = [NSAttributedString.Key.font: UIFont(name: "Fairuz-Bold", size: 16.0)!]
        let messageFont = [NSAttributedString.Key.font: UIFont(name: "Fairuz-Normal", size: 11.0)!]

            let titleAttrString = NSMutableAttributedString(string: title, attributes: titleFont)
            let messageAttrString = NSMutableAttributedString(string: message, attributes: messageFont)

           setValue(titleAttrString, forKey: "attributedTitle")
           setValue(messageAttrString, forKey: "attributedMessage")
        
        
       
         }
    
    
}
