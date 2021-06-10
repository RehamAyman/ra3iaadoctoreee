//
//  UIViewController+PushandPresent.swift
//  SeaTrips
//
//  Created by Sara Mady on 10/28/20.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func pushNewViewController<T:UIViewController>(viewController:T, storyboardName:String) {
        
        guard let nextViewController = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as? T else { return }
            viewController.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
