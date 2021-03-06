//
//  StoryBoard.swift
//  TaxiAwamerCaptain
//
//  Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import UIKit

//public enum Storyboard: String {
//    //storyBoards in APP
////    case Splash
////    case Authentication
//    case Home
//
//    public func instantiate<VC: UIViewController>(_ viewController: VC.Type) -> VC {
//        var detectLang: String!
//        detectLang = "Base"
//        let path = Bundle.main.path(forResource: detectLang , ofType: "lproj")
//        let bundd = Bundle.init(path: path!)
//        guard
//            let vc = UIStoryboard(name: self.rawValue, bundle: bundd)
//                .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
//            else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }
//        return vc
//    }
//
//    public func instantiateEn<VC: UIViewController>(_ viewController: VC.Type) -> VC {
//        let path = Bundle.main.path(forResource: "en" , ofType: "lproj")
//        let bundd = Bundle.init(path: path!)
//        guard
//            let vc = UIStoryboard(name: self.rawValue, bundle: bundd)
//                .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
//            else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }
//        return vc
//    }
//}

extension UIStoryboard {
    class func instantiateInitialViewController(_ id: Storyboard) -> UIViewController {
        let story = UIStoryboard(name: id.rawValue, bundle: nil)
        return story.instantiateInitialViewController()!
    }
}

public enum Storyboard: String {
    case Main
    
    
    public func viewController<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        guard
            let vc = UIStoryboard(name: self.rawValue, bundle: nil)
                .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
            else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }
        
        return vc
    }
    
    public func initialViewController() -> UIViewController {
        let story = UIStoryboard(name: self.rawValue, bundle: nil)
        guard let vc = story.instantiateInitialViewController() else { fatalError("\(self.rawValue) has no InitialViewController") }
        return vc
    }
    
    
    
    
}
extension UIViewController {
    
    class func fromStoryboard() -> Self {
        let storyboardName = ("\(type(of: self))" as NSString).components(separatedBy: ".").first ?? "Main"
        return instantiateFromStoryboardHelper(type: self, storyboardName: storyboardName)
    }
    
    class func fromStoryboard(_ storyboardName: String) -> Self {
        return instantiateFromStoryboardHelper(type: self, storyboardName: storyboardName)
    }
    
    private class func instantiateFromStoryboardHelper<T>(type: T.Type, storyboardName: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as! T
        return controller
    }
    
}


