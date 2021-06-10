//
//  RegisterVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/21/21.
//

import UIKit
import ReCaptcha
import WebKit

class RegisterVC: UIViewController {
    
    //MARK: variables
    var presenter : RegisterVCpresenter!
    var selectedSpec = [String]()
    var selectdTyps = [String]()
    
    
    
    var selectedTypeId = [Int]()
    var selectedSpecId = [Int]()
 
   
    //MARK: OUTLETS
    @IBOutlet weak var specHeight: NSLayoutConstraint!
    @IBOutlet weak var typeHeight: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var RetypePassword: curvedTextField!
    @IBOutlet weak var passwordText: UILabel!
    @IBOutlet weak var PhoneTextFeild: curvedTextField!
    @IBOutlet weak var EmailTextField: curvedTextField!
    @IBOutlet weak var specCollectionView: UICollectionView!
    @IBOutlet weak var TypeCollectionView: UICollectionView!
    @IBOutlet weak var lastNameText: curvedTextField!
    @IBOutlet weak var BirthDateTextField: curvedTextField!
    @IBOutlet weak var FirstNameText: curvedTextField!
    
  
    //MARK: - VIEWDIDLOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
         presenter = RegisterVCpresenter(view: self)
        
        presenter.viewDidLoad()
        
       
        
       
        
    }
     
    //MARK: - IBACTIONS
    
    @IBAction func RegisterPressed(_ sender: UIButton) {
        if passwordText.text != RetypePassword.text {
            Ra3ia.showWarningAlert(title: "", message: "password and confirm password must match".localized)
            
        } else {
        
        
        presenter.cheackData(fname: self.FirstNameText.text ?? ""  ,
                             lname: self.lastNameText.text ?? ""
                             
                             , email: self.EmailTextField.text ?? "" ,
                             phone: self.PhoneTextFeild.text ?? ""
                             , birthday: self.BirthDateTextField.text ?? ""
                             , password: self.passwordText.text ?? ""
                             , specialties: "\(self.selectedSpecId)"
                             , animals: "\(self.selectedTypeId)"
        )
        // ixos)
        // doctor
        // dev id
        }
    }
    

    @IBAction func LoginPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
       
    }
    @IBAction func SelectDatePressed(_ sender: UIButton) {
        
       PresentSelectDate()
         
    }
}
