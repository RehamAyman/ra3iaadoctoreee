//
//  staticksVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit

class staticksVC: UIViewController {
    
    
    var presenter : staticsVCpresenter!
    
    //MARK: - outlets
    
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var tableview: UITableView!
    
    
    //MARK: - viewDIDload
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = staticsVCpresenter(view: self)
       
        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillApper()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animateView()
    }
    
    
    
    //MARK: - actions
    
    @IBAction func backbutton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
