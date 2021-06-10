//
//  APPFont.swift
//  TaxiAwamerCaptain
//
//  Created by Abdallah Nader on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import UIKit

protocol AppFont {
    func descriptor(for size: CGFloat) -> UIFontDescriptor
    func font(for size: CGFloat) -> UIFont
}

// MARK: - Custom Font
/// Set Custom Font responsive to DeviceSize
extension AppFont where Self: RawRepresentable {
    func descriptor(for size: CGFloat) -> UIFontDescriptor {
        return UIFontDescriptor(name: self.rawValue as! String, size: size.responsive)
    }
    
    func font(for size: CGFloat) -> UIFont{
        return UIFont(descriptor: descriptor(for: size), size: size.responsive)
    }
}
