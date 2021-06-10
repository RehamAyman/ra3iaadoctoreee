//
//  UIButtonExtension.swift
//  TaxiAwamerCaptain
//
//   Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import UIKit

extension UIButton{
    /// Change Sepicif words in sentence
    ///
    /// - Parameters:
    ///   - fullText: write full text
    ///   - changeText: write text you want to change
    ///   - color: add color for changed text
    ///   - font: add font for changed text
    public func halfTextColorChange(fullText : String , changeText : String, color: UIColor,fullColor:UIColor, font: UIFont) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(.foregroundColor, value: fullColor, range: (strNumber).range(of: fullText))
        attribute.addAttribute(.foregroundColor, value: color, range: range)
        attribute.addAttribute(.font, value: font, range: range)
        self.setAttributedTitle(attribute, for: .normal)
//        self.attributedText = attribute
    }
    
    
}
