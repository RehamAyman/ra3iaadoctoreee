//
//  UIVIewControllerMessageExtension.swift
//  SeaTrips
//
//  Created by Sara Mady on 10/28/20.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//



import Foundation
import UIKit
//import SwiftMessages

extension UIViewController {
    
    
//    func showMessage(title: String? = nil, sub: String?, type: Theme = .warning, layout: MessageView.Layout = .statusLine,Btn:UIButton? = nil) {
//        // Instantiate a message view from the provided card view layout. SwiftMessages searches for nib
//        // files in the main bundle first, so you can easily copy them into your project and make changes.
//        let view = MessageView.viewFromNib(layout: layout)
//
//        // Theme message elements with the warning style.
//        view.configureTheme(type)
//        view.button?.isHidden = true
//        // Add a drop shadow.
//        //        view.configureDropShadow()
//       // Btn!.shake(duration: 0.5, values: [-12.0, 12.0, -12.0, 12.0, -6.0, 6.0, -3.0, 3.0, 0.0])
//
//        // Set message title, body, and icon. Here, we're overriding the default warning
//        // image with an emoji character.
//
//        view.configureContent(title: title ?? "", body: sub ?? "", iconText: "")
//
//        // add Configuration for view
//        let config = SwiftMessages.Config()
//
//        // Show the message.
//        SwiftMessages.show(config: config, view: view)
//    }
    
//    func showNoInternetMessage(completion:@escaping () -> Void) {
//           // Instantiate a message view from the provided card view layout. SwiftMessages searches for nib
//           // files in the main bundle first, so you can easily copy them into your project and make changes.
//        let view = MessageView.viewFromNib(layout: .messageView)
//
//        // Theme message elements with the warning style.
//        view.configureTheme(.error)
//        view.backgroundColor = #colorLiteral(red: 0.7175801079, green: 0.08493364494, blue: 0.1560569611, alpha: 1)
//        // Add a drop shadow.
////        reloadDate()
//        view.configureDropShadow()
//        view.configureContent(title: title ?? "", body: "Bad Internet Connection".localized, iconText: "")
//        if #available(iOS 13.0, *) {
//            view.button!.setImage(#imageLiteral(resourceName: "refresh").withTintColor(UIColor.BasicColor), for: .normal)
//        } else {
//            // Fallback on earlier versions
//        }
//        view.button!.setTitle("Reload".localized, for: .normal)
//        view.button!.setTitleColor(UIColor.BasicColor, for: .normal)
//        view.buttonTapHandler = { success in
//
//            SwiftMessages.hide()
////             reloadDate()
//            completion()
//
//        }
//
//
//        // add Configuration for view
//        var config = SwiftMessages.Config()
//        config.interactiveHide = false
//        config.duration = .forever
//        SwiftMessages.show(config: config, view: view)
//       }
    
    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}
