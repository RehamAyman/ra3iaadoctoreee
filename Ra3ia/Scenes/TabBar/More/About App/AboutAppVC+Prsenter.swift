//
//  AboutAppVC+Prsenter.swift
//  Ra3ia
//
//  Created by Sara Mady on 13/04/2021.
//

import Foundation
import SKActivityIndicatorView
extension AboutAppVC:ApoutAppView{
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func setAboutAppData(about: String) {
        self.aboutTextView.text = about
    }
    
    
}
