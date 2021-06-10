//
//  Alert.swift
//  Ri7nak
//
//  Created by Sara Ashraf on 1/19/20.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    class func showAlertOnVC(target: UIViewController, title: String, message: String) {
        let title = title
        let message = message
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok".localized, style: .default, handler: nil))
        target.present(alert, animated: true, completion: nil)
    }
    
    class func showAlert(target: UIViewController, title: String, message: String, okAction: String, actionCompletion: ((UIAlertAction) -> Void)?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okAction, style: .default, handler: actionCompletion))
        target.present(alert, animated: true, completion: nil)
    }
    
    class func openSetting(target:UIViewController){
        
            let alertController = UIAlertController(title: "I can not locate you 📍".localized, message: "Open GPS".localized, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Open Setting".localized, style: UIAlertAction.Style.default) {
                UIAlertAction in
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                    })
                }
            }
            let cancelAction = UIAlertAction(title: "Cancel".localized, style: UIAlertAction.Style.cancel) {
                UIAlertAction in
              
            }
            // Add the actions
            alertController.view.tintColor = UIColor.BasicColor
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)

            // Present the controller
            target.present(alertController, animated: true, completion: nil)
            
    }
    
    
}
