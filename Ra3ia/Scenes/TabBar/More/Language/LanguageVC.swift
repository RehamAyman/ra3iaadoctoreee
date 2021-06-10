//
//  LanguageVC.swift
//  Ra3ia
//
//  Created by Sara Mady on 01/04/2021.
//

import UIKit
import CBFlashyTabBarController
class LanguageVC: UIViewController {

    @IBOutlet weak var LabguageTitle: UILabel!
    @IBOutlet weak var LanguageLabel: UILabel!
    @IBOutlet weak var LanguageButton: UIButton!
    
    let paragraphStyle = NSMutableParagraphStyle()
      var Language = ""
      var langArray = ["English" , "عربي"]

    
    var isTalkLanguage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(AppLanguage.getLang() == "ar"){
            self.LanguageButton.setTitle("عربي", for: .normal)
              }else{
                self.LanguageButton.setTitle("English", for: .normal)
              }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if(isTalkLanguage == "true"){
            self.LabguageTitle.text = "Talk Language".localized
            self.LanguageLabel.text = "Talk Language".localized
        }
        
       
        
    }
    @IBAction func changeLanguageAction(_ sender: Any) {
        let alert = UIAlertController()
        
        alert.customAlert(title:  "Change Language".localized, message:"Are you sure you want to Change Language?".localized)
        
        alert.addAction(UIAlertAction(title: "العربيه".localized, style: .default, handler: { action in
            if AppLanguage.currentLanguage().contains("en"){
                           AppLanguage.setAppLanguage(lang: "ar")
                           Localizer.DoTheExhange()
                           self.setAppSemantic()
                           guard let window = UIApplication.shared.keyWindow else { return }
                           
                let vc =  Storyboard.Main.viewController(StartViewController.self)
                           window.rootViewController = vc
                       }
        }))
        alert.addAction(UIAlertAction(title: "English".localized, style: .default, handler: { action in

            if AppLanguage.currentLanguage().contains("ar"){
                            AppLanguage.setAppLanguage(lang: "en")
                            Localizer.DoTheExhange()
                            self.setAppSemantic()
                            guard let window = UIApplication.shared.keyWindow else { return }
                            
                let vc =  Storyboard.Main.viewController(StartViewController.self)
                            window.rootViewController = vc
                        }
                }))
        alert.addAction(UIAlertAction(title: "Cancel".localized, style: .cancel, handler: { action in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setAppSemantic() {
            // app direction
            if AppLanguage.currentLanguage().contains("en") {
                UIView.appearance().semanticContentAttribute = .forceLeftToRight
                UILabel.appearance().semanticContentAttribute = .forceLeftToRight
                UITextField.appearance().textAlignment = .left
                UITextView.appearance().textAlignment = .left
                UITableView.appearance().semanticContentAttribute = .forceLeftToRight
                UITabBar.appearance().semanticContentAttribute = .forceLeftToRight
                
            } else if AppLanguage.currentLanguage().contains("ar") {
                UIView.appearance().semanticContentAttribute = .forceRightToLeft
                UILabel.appearance().semanticContentAttribute = .forceRightToLeft
                UITextField.appearance().textAlignment = .right
                UITextView.appearance().textAlignment = .right
                UITableView.appearance().semanticContentAttribute = .forceRightToLeft
                UITabBar.appearance().semanticContentAttribute = .forceRightToLeft

            }
        }


}
