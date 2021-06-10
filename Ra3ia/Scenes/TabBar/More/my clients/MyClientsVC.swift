//
//  MyClientsVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit

class MyClientsVC: UIViewController {
    //MARK: - OUTLETS
    
    @IBOutlet weak var SegementOutlet: UISegmentedControl!
    
    @IBOutlet weak var tableview: UITableView!
    
    var presenter : clientVcpresenter!
    
    //MARK: - view cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = clientVcpresenter(view: self)
        SetUpTableview()
        SegementOutlet.setTitle("Current Clients".localized, forSegmentAt: 1)
        SegementOutlet.setTitle("New Clients".localized, forSegmentAt: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viwDidLoad()
    }
    //MARK: - Actions
    
    
    @IBAction func SegementPressed(_ sender: UISegmentedControl) {
        fetchingDataSuccess()
    }
    
    @IBAction func BackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
