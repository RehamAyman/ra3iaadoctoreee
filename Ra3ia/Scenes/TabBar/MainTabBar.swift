//
//  MainTabBar.swift
//  Ra3ia
//
//  Created bySara Mady on 3/22/21.
//

import UIKit
class MainTabBar: UITabBarController {
 override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.selectedIndex = 0
    let appearance = UITabBarItem.appearance()
    let attributes = [NSAttributedString.Key.font:UIFont(name: "Fairuz-Normal", size: 10)]
    appearance.setTitleTextAttributes(attributes, for: .normal)
    tabBar.items![0].title = NSLocalizedString("home".localized, comment: "")
    tabBar.items![1].title = NSLocalizedString("Messages".localized, comment: "")
    tabBar.items![2].title = NSLocalizedString("More".localized, comment: "")
      
    }
    
    
    

    
    


}

