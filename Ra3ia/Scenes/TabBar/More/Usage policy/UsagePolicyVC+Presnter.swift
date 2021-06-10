//
//  UsagePolicyVC+Presnter.swift
//  Ra3ia
//
//  Created by Sara Mady on 13/04/2021.
//

import Foundation
import SKActivityIndicatorView
extension UsagePolicyVC: UsagePolicyView{
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func setUsagePolicyData(usgePolcy: String) {
        self.usgeTextView.text = usgePolcy
    }
    
    
}
