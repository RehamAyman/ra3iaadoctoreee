//
//  UILabelExtension.swift
//  TaxiAwamerCaptain
//
//  Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import UIKit

extension UILabel {
    
    
    /// Change Sepicif words in sentence
    ///
    /// - Parameters:
    ///   - fullText: write full text
    ///   - changeText: write text you want to change
    ///   - color: add color for changed text
    ///   - font: add font for changed text
    public func halfTextColorChange(fullText : String , changeText : String, color: UIColor, font: UIFont) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(.foregroundColor, value: color, range: range)
        attribute.addAttribute(.font, value: font, range: range)
        self.attributedText = attribute
    }
}
@IBDesignable class PaddingLabel: UILabel {

    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }
}
