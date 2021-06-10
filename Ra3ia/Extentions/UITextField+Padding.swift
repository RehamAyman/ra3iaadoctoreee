//
//  UITextField+Padding.swift
//  TaxiAwamerCaptain
//
//   Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import UIKit

@IBDesignable
final class TextField: UITextField {
    @IBInspectable var insetX: CGFloat = 0
    @IBInspectable var insetY: CGFloat = 0
    @IBInspectable var bottomBorderColor: UIColor = .lightGray
    @IBInspectable var bottomBorderHeight: CGFloat = 0
    
    var bottomBorder = UIView()
    
    // Insets for placholder
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    // Insets for text
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if bottomBorderHeight > 0 {
            bottomBorder.backgroundColor = bottomBorderColor
            addSubview(bottomBorder)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bottomBorderHeight > 0 {
            bottomBorder.frame = CGRect(x: 0, y: self.layer.frame.height, width: self.layer.frame.width, height: bottomBorderHeight)
        }
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.leftView = paddingView
        self.rightViewMode = .always
        self.leftViewMode = .always
    }
}

