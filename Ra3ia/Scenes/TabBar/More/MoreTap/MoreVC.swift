//
//  MoreVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/21/21.
//

import UIKit


class MoreVC: UIViewController {
    
    var presenter : MoreVcPresenter!
    
    //MARK: - outlets
    
    @IBOutlet weak var tableview: UITableView!
    
    //MARK: -  cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpTableView()
        presenter = MoreVcPresenter(view: self)
        tableview.tableFooterView?.isHidden = true

        self.animateView()
        
    }
   
    //MARK: - IBActions
    
    @IBAction func NotificationPressed(_ sender: UIButton) {
        goToNotifications()
    }
    
    
    
    
}
