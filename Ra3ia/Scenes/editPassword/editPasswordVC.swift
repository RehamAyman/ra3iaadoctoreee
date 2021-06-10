//
//  editPasswordVC.swift
//  Ra3ia
//
//  Created bySara Mady on 4/1/21.
//

import UIKit

class editPasswordVC: UIViewController {

    @IBOutlet weak var confirmOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmOutlet.AddTOPCorners(num: 25)
        

    }
    


    @IBAction func ConfirmButton(_ sender: UIButton) {
        
    }
    
    
    
    
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
