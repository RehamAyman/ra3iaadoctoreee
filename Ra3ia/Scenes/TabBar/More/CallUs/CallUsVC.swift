//
//  CallUsVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/25/21.
//

import UIKit

class CallUsVC: UIViewController {
    
    //MARK:- OUTLETS
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var Phone: UILabel!
    @IBOutlet weak var whatsApp: UILabel!
    
    var presenter : CullUsPresnter!

    
    //MARK: - VIEWDIDLOAD

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CullUsPresnter(view: self)
        presenter.viewWillApper()
    }
    
    @IBAction func twitterAction(_ sender: Any) {
        presenter.openTwtter()
    }
    
    @IBAction func LinkedInAction(_ sender: Any) {
        presenter.openLinkedIn()
    }
    @IBAction func faceBookAction(_ sender: Any) {
        presenter.openFaceBook()
    }
    
    @IBAction func instgramAction(_ sender: Any) {
        presenter.openInstgram()
    }
    
    //MARK: - IBACTIONS

    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func openPhonAction(_ sender: Any) {
            if let url = URL(string: "tel://\(Phone.text ?? "")"),
               UIApplication.shared.canOpenURL(url) {
                  if #available(iOS 10, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler:nil)
                   } else {
                       UIApplication.shared.openURL(url)
                   }
               } else {
                        // add error message here
               }
        }
        @IBAction func openEmailAction(_ sender: Any) {
            let mailURL = URL(string: "message://\(Email.text ?? "")")!
               if UIApplication.shared.canOpenURL(mailURL) {
                   UIApplication.shared.open(mailURL, options: [:], completionHandler: nil)
                }
            
        }
        @IBAction func openWhatsAction(_ sender: Any) {
            let phoneNumber = whatsApp.text ?? "" // you need to change this number
            let appURL = URL(string: "https://api.whatsapp.com/send?phone=\(phoneNumber)")!
            if UIApplication.shared.canOpenURL(appURL) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
                }
                else {
                    UIApplication.shared.openURL(appURL)
                }
            } else {
                // WhatsApp is not installed
            }
        }
}
