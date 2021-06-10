//
//  ForgetPasswordVC.swift
//  Ra3ia
//
//  Created bySara Mady on 4/26/21.
//

import UIKit

class ForgetPasswordVC: UIViewController {
    var presenter : ForgetPasswordPresnter!

    @IBOutlet weak var mobilNumber: curvedTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ForgetPasswordPresnter(view: self)
     

    }
    
    @IBAction func confirm(_ sender: UIButton) {
      presenter.cheackValidData(phone: mobilNumber.text ?? "" )
        
        
        
    }
    


}
