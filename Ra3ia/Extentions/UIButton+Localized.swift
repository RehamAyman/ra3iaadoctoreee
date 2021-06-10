//
//  UIButton+Localized.swift
//  TaxiAwamerCaptain
//
//   Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
extension UIButton {
    
    @IBInspectable var localizedText: String? {
        get {
            return currentTitle
        }
        set {
            setTitle(newValue?.localized, for: .normal)
        }
    }
    
//    var localizedFont: FontTypesWithSize {
//        set {
//            titleLabel?.font = UIFont.getLocalizedFont(type: newValue)
//        }get {
//            return .regular(16)
//        }
//    }
    
}
