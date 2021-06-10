//
//  MyReviewVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit
import Cosmos

class MyReviewVC: UIViewController {

    @IBOutlet weak var reviewStars: CosmosView!
    
    var presenter : MyReviewPrisnter!

    override func viewDidLoad() {
        super.viewDidLoad()
        reviewStars.isUserInteractionEnabled = false
        presenter = MyReviewPrisnter(view: self)
        presenter.viewWillApper()
    }
    

    @IBAction func BackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
