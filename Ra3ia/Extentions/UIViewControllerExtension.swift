//
//  UIViewControllerExtension.swift
//  TaxiAwamerCaptain
//
//   Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import UIKit
import SideMenu

extension UIViewController {
    
    // present
    func presentDetails(viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
//    func openSideMenu(){
//        
//        if AppLanguage.currentLanguage().contains("en"){
//            let sideMenuVc = Storyboard.ClintHome.viewController(SideMenuViewController.self)
//            let menuNavgtion = SideMenuNavigationController(rootViewController: sideMenuVc)
//            SideMenuManager.default.addPanGestureToPresent(toView: (self.navigationController?.navigationBar)!)
//            SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView:(self.navigationController?.navigationBar)!)
//            SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
//
//            menuNavgtion.statusBarEndAlpha = 0
//            menuNavgtion.menuWidth = 300
//            menuNavgtion.navigationController?.barTintColor = .clear
//            menuNavgtion.presentationStyle = .menuSlideIn
//            menuNavgtion.presentationStyle.onTopShadowOpacity = 1
//            SideMenuManager.default.leftMenuNavigationController = menuNavgtion
//            present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
//
//        }else{
//            let sideMenuVc = Storyboard.ClintHome.viewController(SideMenuViewController.self)
//            let menuNavgtion = SideMenuNavigationController(rootViewController: sideMenuVc)
//            SideMenuManager.default.addPanGestureToPresent(toView: (self.navigationController?.navigationBar)!)
//             SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView:(self.navigationController?.navigationBar)! )
//            menuNavgtion.statusBarEndAlpha = 0
//            menuNavgtion.menuWidth = 300
//            menuNavgtion.presentationStyle = .menuSlideIn
//            menuNavgtion.presentationStyle.onTopShadowOpacity = 1
//            SideMenuManager.default.rightMenuNavigationController = menuNavgtion
//            present(SideMenuManager.default.rightMenuNavigationController!, animated: true, completion: nil)
//        }
//    }
    
    // dismiss
    func dismissDetails() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
    
    public static var defaultNib: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
    
    public static var storyboardIdentifier: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
}
