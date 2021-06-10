//
//  RoundedImage.swift
//  Ra3ia
//
//  Created bySara Mady on 3/22/21.
//

import UIKit


extension UIImageView {

    func MakeRounded() {

        self.layer.borderWidth = 0.7
        self.layer.masksToBounds = false
        self.layer.borderColor = #colorLiteral(red: 0.8855473399, green: 0.5395184755, blue: 0.06974243373, alpha: 1)
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
  
    
}
