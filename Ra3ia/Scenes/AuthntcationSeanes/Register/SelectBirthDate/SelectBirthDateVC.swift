//
//  SelectBirthDateVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/24/21.
//

import UIKit

protocol selectDate {
    func selectedDate(date:String)
}


class SelectBirthDateVC: UIViewController {
    //MARK:- OUTLETS
    
    var delgate:selectDate!
    
    @IBOutlet weak var packer: UIDatePicker!
    
    //MARK: - VIEWDIDLOAD

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    //"yyyy/MM/dd"
    
    @IBAction func confirmButton(_ sender: Any) {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = .none
        timeFormatter.dateFormat = "dd-MM-yyyy"
        self.delgate.selectedDate(date:  timeFormatter.string(from: packer.date))
        
        
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func CanselButton(_ sender: UIButton) {
        self.dismiss(animated: true )
    }
    
}

