//
//  CullUS+Prisnter.swift
//  Ra3ia
//
//  Created by Sara Mady on 13/04/2021.
//

import Foundation
import SKActivityIndicatorView
extension CallUsVC:CullUsView{
    func setDate(email: String, phone: String, whatsApp: String) {
        self.Email.text = email
        self.Phone.text = phone
        self.whatsApp.text = whatsApp
    }
    
    
    func openFaceBook(link: String) {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    
    func openTwitter(link: String) {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    
    func openWhatsApp(link: String) {
        let urlString = link

        let urlStringEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)

        let URL = NSURL(string: urlStringEncoded!)

        if UIApplication.shared.canOpenURL(URL! as URL) {
            UIApplication.shared.openURL(URL! as URL)
        }
    }
    
    func openInstagram(link: String) {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    
    func openLinkedIn(link: String) {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    
}
