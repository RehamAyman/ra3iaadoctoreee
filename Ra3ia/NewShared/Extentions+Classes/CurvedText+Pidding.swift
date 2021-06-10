//
//  CurvedText+Pidding.swift
//  Ra3ia
//
//  Created bySara Mady on 3/21/21.
//

import UIKit

class curvedTextField: UITextField {
    
    //MARK: - class globals
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    
    
    //MARK: - curved textfield
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        layer.borderWidth = 0.75
        layer.borderColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    }
    
    
    
    //MARK: - edges methods
    
        override open func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

        override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

        override open func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
    

}
class EditableTextField: UITextField {
    
    //MARK: - class globals
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    
    
    //MARK: - curved textfield
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 20
        layer.backgroundColor = #colorLiteral(red: 0.9528377652, green: 0.9530007243, blue: 0.9528275132, alpha: 1)
        
       
    }
    
    
    
    //MARK: - edges methods
    
        override open func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

        override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

        override open func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
    

}
