//
//  addClientRate+presenterDelegate.swift
//  Ra3ia
//
//  Created by Reham Ayman on 6/10/21.
//

import Foundation
import SKActivityIndicatorView



extension AddClientRateVC : addClientRateView {
   
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func backHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6 ){
            guard let window = UIApplication.shared.keyWindow else { return }
            
            let Vc = Storyboard.Main.viewController(StartViewController.self)
            
                window.rootViewController = Vc
            }
    }
    
    func showSuccess(msg: String) {
        showSuccessAlert(title: "", message: msg)
    }
    
    
}
