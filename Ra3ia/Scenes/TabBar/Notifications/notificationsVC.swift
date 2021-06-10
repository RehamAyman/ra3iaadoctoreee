//
//  notificationsVC.swift
//  Ra3ia
//
//  Created by Sara Mady on 01/06/2021.
//

import UIKit

class notificationsVC: UIViewController {
    
    
    //MARK:- OUTLETS
    
    @IBOutlet weak var tableview: UITableView!
    
    var presnter:NotificatonPresenter!
    
    //MARK:- VIEWDIDLOAD
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presnter = NotificatonPresenter(view: self)
        self.SetUpTableview()
        presnter.viewWillApper()
        
        
    }
    

    //MARK:- ACTIONS
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
