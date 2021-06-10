//
//  ComplaintsVC+Prisnter.swift
//  Ra3ia
//
//  Created by Sara Mady on 13/04/2021.
//

import Foundation
import SKActivityIndicatorView
extension ComplaintsVC:ComplaintsView{
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func showSuccessMessga(msg: String) {
        showErrorAlert(title: "", message: msg)
        self.supjectTextFeild.text = ""
        self.SubjectTitleTextField.text = ""
    }
    
    func showComplateData(msg: String) {
        completData(title: "", message: msg)
    }
    
    
}
