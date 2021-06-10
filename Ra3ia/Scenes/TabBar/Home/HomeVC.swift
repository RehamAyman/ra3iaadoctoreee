//
//  ConversationVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/22/21.
//

import UIKit
import ViewAnimator

class HomeVC: UIViewController {
    //MARK: - vars
    var presenter : HomeVcPresenter!
    var timer : Timer = Timer()
    var count : Int = 0
    var timerCounting : Bool = false
    var userId = 0
    
    //MARK: - Outlets
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var MessageRequests: UILabel!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var DissconnectedView: UIView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var TIMER: UILabel!
    
    
    
    //MARK: - cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.DissconnectedView.isHidden = true
      //  self.Connected(bool: true)
        timerCounting = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerCounter), userInfo: nil, repeats: true)
        SetUpTableview()
        UserImage.MakeRounded()
        presenter = HomeVcPresenter(view: self)
      }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animateView()
    }
    
    //MARK: - IBActions
    
    @IBAction func NotificationPressed(_ sender: UIButton) {
        
        goToNotifications()
    }
    
    
    @IBAction func swichPressed(_ sender: UISwitch) {
        if sender.isOn {
            // active
          Connected(bool: true)
            
        } else {
            // dissconnected
        Connected(bool: false)
            
            
            
        }
        
    }
    
    
    @objc func TimerCounter() {
        count = count + 1
        let time = secondToMinToHours(seconds: count)
        let timeString = makeTimeString(hours: time.0, min: time.1, sec: time.2)
        TIMER.text = timeString
    }
    

}
