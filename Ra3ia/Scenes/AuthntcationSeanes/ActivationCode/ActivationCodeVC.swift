//
//  ActivationCodeVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/21/21.
//

import UIKit

class ActivationCodeVC: UIViewController {

    var presenter:ActvtaionCodePresnter!

    @IBOutlet weak var vreficationCodeText: curvedTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.hideKeyboardWhenTappedAround()
        presenter = ActvtaionCodePresnter(view: self)
        
    }
    
    @IBAction func ConfirmAction(_ sender: UIButton) {
        presenter.cheackValidData(vrefcationCode: self.vreficationCodeText.text ?? "")
    }
    

    
    @IBAction func didntRecievCode(_ sender: UIButton) {
        
        presenter.resendCode()
    }
    
    
    
}
