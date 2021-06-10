//
//  UILabel+Localized.swift
//  TaxiAwamerCaptain
//
//   Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import UIKit

@IBDesignable
extension UILabel {
    
    @IBInspectable var localizedText: String? {
        get {
            return text
        }
        set {
            text = newValue?.localized
        }
    }
    
//    var localizedFont: FontTypesWithSize {
//        set {
//            font = UIFont.getLocalizedFont(type: newValue)
//        }get {
//            return .regular(16)
//        }
//    }
    
}
