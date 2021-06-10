//
//  ActivationCode+Presnter.swift
//  Ra3ia
//
//  Created by Sara Mady on 05/04/2021.
//

import Foundation
import SKActivityIndicatorView

extension ActivationCodeVC: ActvtaionCodeView{
   
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func showSuccess(msg: String) {
        showSuccessAlert(title: "", message: msg)
        self.LoginToApplication(type: "doctor")
    }
    
    func LoginToApplication(type: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard let window = UIApplication.shared.keyWindow else { return }
            let vc = Storyboard.Main.viewController(StartViewController.self)
            window.rootViewController = vc
        }
        
        
        
    }
    
    
    func showStatusalert(message: String) {
        showSuccessAlert(title: "", message: message)
    }

    
}
