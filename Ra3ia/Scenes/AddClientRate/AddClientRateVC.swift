//
//  AddClientRateVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit
import Cosmos

class AddClientRateVC: UIViewController {
    
    var presenter : AddClientRatePresenter!
    var reciverId = 0
    
    //MARK: - OUTLETS
    
    
    
    
    @IBOutlet weak var clientRate: CosmosView!
    @IBOutlet weak var ConfirmOutlet: UIButton!
    
    
    
    
    //MARK: - VIEWDIDLOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AddClientRatePresenter(view: self)
        self.clientRate.rating = Double(0)
        ConfirmOutlet.AddTOPCorners(num: 10.0)
        
        print("============ rec id ")
        print(self.reciverId)

       
    }
    
    //MARK: - IBACTIONS

    @IBAction func ConfirmPressed(_ sender: UIButton) {
        
        let rate = clientRate.rating
        
        if rate == 0 {
            showWarningAlert(title: "", message: "please make sure to give the client rate .. ".localized)
        } else {
            presenter.addClientRate(value: Int(rate) , id: self.reciverId)
        }
        
        
        
        
    }
    

}
