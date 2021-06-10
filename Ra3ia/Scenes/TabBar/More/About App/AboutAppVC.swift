//
//  AboutAppVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit

class AboutAppVC: UIViewController {
    
    // MARK: - OUTLETS
    
    var presenter : AboutAppVCPresnter!

    @IBOutlet weak var aboutTextView: UITextView!
    
    // MARK: - VIEWDIDLOAD

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AboutAppVCPresnter(view: self)
        presenter.viewWillApper()

    }
    
    @IBAction func Back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
