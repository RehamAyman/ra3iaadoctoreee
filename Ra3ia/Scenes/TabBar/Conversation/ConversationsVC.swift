//
//  ConversationsVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/22/21.
//

import UIKit



class ConversationsVC: UIViewController {
    
    var presenter : ConversationVcPresenter!
    
    
    //MARK:-  OUTLETS
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var SegementOutlet: UISegmentedControl!
  
    
    
    //MARK:-  cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        presenter = ConversationVcPresenter(view: self)
        SetUpTableview()
        SegementOutlet.setTitle("Finshed".localized, forSegmentAt: 1)
        SegementOutlet.setTitle("Ongoing Messages".localized, forSegmentAt: 0)
     
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewWillApper()
        SocketConnection.sharedInstance.socket.off("newMessage")
        SocketConnection.sharedInstance.socket.emit("exitChat", with: []) {
            print("added user id \(String(User.currentUser?.id ?? 0))")
        }
    }
    
    //MARK:-  IBActions
    
    @IBAction func segmentPressed(_ sender: UISegmentedControl) {
        FeatchData()
        
    }
    
    @IBAction func notification(_ sender: UIButton) {
        goToNotifications()
    }
    
    
    
    
    
}
