//
//  ComplaintsVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/25/21.
//

import UIKit

class ComplaintsVC: UIViewController {
    
    
    //MARK: - OUTLETS
    @IBOutlet weak var SubjectTitleTextField: UITextField!
    @IBOutlet weak var supjectTextFeild: UITextField!
    
    //MARK: -  VIEW DIDLOAD
    var presenter : ComplaintsVCPresnter!


    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ComplaintsVCPresnter(view: self)

      
    }
    
    //MARK: -  ACTIONS
    
    @IBAction func SendButton(_ sender: UIButton) {
        presenter.CheckData(subject: self.SubjectTitleTextField.text ?? "", content:  self.supjectTextFeild.text ?? "")
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
