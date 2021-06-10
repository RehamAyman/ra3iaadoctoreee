//
//  CBFlashyTabBarController.swift
//  CBFlashyTabBarController
//
//  Created by Anton Skopin on 28/11/2018.
//  Copyright © 2018 cuberto. All rights reserved.
//

import UIKit

open class CBFlashyTabBarController: UITabBarController {
    

    fileprivate var shouldSelectOnTabBar = true
   
    open override var selectedViewController: UIViewController? {
        willSet {
            guard shouldSelectOnTabBar,
                  let newValue = newValue else {
                shouldSelectOnTabBar = true
                return
            }
            guard let tabBar = tabBar as? CBFlashyTabBar, let index = viewControllers?.index(of: newValue) else {
                return
            }
            tabBar.select(itemAt: index, animated: false)
        }
    }

    open override var selectedIndex: Int {
        willSet {
            guard shouldSelectOnTabBar else {
                shouldSelectOnTabBar = true
                return
            }
            guard let tabBar = tabBar as? CBFlashyTabBar else {
                return
            }
            tabBar.select(itemAt: selectedIndex, animated: false)
        }
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.items![0].title = NSLocalizedString("Home", comment: "")
                tabBar.items![1].title = NSLocalizedString("Messages", comment: "")
                tabBar.items![2].title = NSLocalizedString("More", comment: "")
        
        guard self.tabBar as? CBFlashyTabBar == nil else {
            return
        }
        let tabBar = CBFlashyTabBar()

        if #available(iOS 11.0, *) {
          
            tabBar.tintColor = UIColor(named: "BaseColour")
        } else {
            // Fallback on earlier versions
            tabBar.tintColor = .black
        }
        

      
        tabBar.barTintColor = tabBar.barTintColor
     
        self.setValue(tabBar, forKey: "tabBar")
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    open var barHeight: CGFloat {
        get {
            return (tabBar as? CBFlashyTabBar)?.barHeight ?? tabBar.frame.height
        }
        set {
            (tabBar as? CBFlashyTabBar)?.barHeight = newValue
        }
    }
//    override open func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//            button.frame = CGRect.init(x: self.view.center.x - 30, y: self.tabBar.center.y - 70, width: 60, height: 60)
//
//
//    }
    private func updateTabBarFrame() {
        var tabFrame = tabBar.frame
        if #available(iOS 11.0, *) {
            tabFrame.size.height = barHeight + view.safeAreaInsets.bottom
        } else {
            tabFrame.size.height = barHeight
        }
        tabFrame.origin.y = self.view.frame.size.height - tabFrame.size.height
        tabBar.frame = tabFrame
        tabBar.setNeedsLayout()
    }
    
    @available(iOS 11.0, *)
    open override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        updateTabBarFrame()
    }

    open override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let idx = tabBar.items?.index(of: item) else {
            return
        }
        if let controller = viewControllers?[idx] {
            shouldSelectOnTabBar = false
            selectedIndex = idx
            delegate?.tabBarController?(self, didSelect: controller)
        }
    }

}
