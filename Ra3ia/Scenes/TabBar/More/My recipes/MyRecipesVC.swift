//
//  My recipesVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit

class MyRecipesVC: UIViewController {
    
    var presenter : myRecipesVCpresenter!
    //MARK: - OUTLETS
    
    @IBOutlet weak var tableview: UITableView!
    
    
    
    //MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
         SetUpTableview()
         presenter = myRecipesVCpresenter(view: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getRecipesData()
    }

    //MARK: - actions
    
    @IBAction func backbutton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
