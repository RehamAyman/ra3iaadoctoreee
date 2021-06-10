//
//  UIImageViewExtension.swift
//  TaxiAwamerCaptain
//
//   Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
//
    //    @IBInspectable var localizedimage: UIImageView? {
    //
    //
    //          }
    
     func setImageWith(_ linkString: String?)  {
         guard let linkString = linkString,
             let url = URL(string: linkString) else { return }
         self.kf.setImage(with: url,
                       placeholder: #imageLiteral(resourceName: "logo"),
                       options: [.scaleFactor(UIScreen.main.scale),
                       .transition(.fade(1)),
                       .cacheOriginalImage],
                       progressBlock: nil) { (result) in
         }
        // self.kf.setImage(with: url)
     }
    
    func setImageWith(url: URL?) {
        guard let url = url else { return  }
        self.kf.setImage(with: url)
    }
}
