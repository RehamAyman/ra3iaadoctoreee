//
//  UITextField+PlaceHolder.swift
//  TaxiAwamerCaptain
//
//   Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import UIKit

@IBDesignable
extension UITextField {
    @IBInspectable var placeHolderLocalized: String? {
        set {
            placeholder = newValue?.localized
        }get {
            return placeholder
        }
    }
    
}
extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}
