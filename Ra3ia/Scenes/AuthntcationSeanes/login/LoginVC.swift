//
//  LoginVC.swift
//  Ra3ia
//
//  Created by Sara Mady on 24/03/2021.
//


import UIKit

class LoginVC: UIViewController {

    //MARK: - OUTLETS
    
    @IBOutlet weak var mobileNumber: curvedTextField!
    @IBOutlet weak var password: curvedTextField!
    
    
    //MARK: - Varibles
    
    
    var presenter:LoginVCpresenter!
    
    //MARK : - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        presenter = LoginVCpresenter(view: self)
        presenter.viewDidLoad()
    }
    //MARK: - IBACTIONS
    
    @IBAction func Login(_ sender: UIButton) {
        self.presenter.cheackValidData(mobile: self.mobileNumber.text ?? "", password: self.password.text ?? "", device_id: AppDelegate.FCMTOKEN)
    }
    
    @IBAction func ForgetPassword(_ sender: UIButton) {
        
        let vc = Storyboard.Main.viewController(ForgetPasswordVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func register(_ sender: UIButton) {
        goToRegister()
    }
    
}
