//
//  resetPasswordVc.swift
//  Ra3ia
//
//  Created bySara Mady on 4/28/21.
//

import UIKit

class resetPasswordVc: UIViewController {
    
    var presenter : resetPasswordPresenter!
    @IBOutlet weak var newPasswordConfirm: UITextField!
    @IBOutlet weak var verficationCode: UITextField!
    
    @IBOutlet weak var NewPass: UITextField!
    
    @IBOutlet weak var confirmOutlet: UIButton!
    
    
    
    var mobileNum = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = resetPasswordPresenter(view: self)
        presenter.viewDidLoad()

       
    }
    

  
    @IBAction func confirm(_ sender: UIButton) {
        presenter.cheackValidData(phone: mobileNum, password: NewPass.text ?? "", newPassword: newPasswordConfirm.text ?? "" , v_code: verficationCode.text ?? "" )
    }
    
}
