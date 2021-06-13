//
//  SendTreatmentVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/24/21.
//

import UIKit
import McPicker

protocol setSelectedTretmintID {
    func setSelectedTretmintID()
}
class SendTreatmentVC: UIViewController , UIActionSheetDelegate {
  
    //MARK: - OUTLETS
    
    @IBOutlet weak var selectTextField: UITextField!
    @IBOutlet weak var ConfirmOutlet: UIButton!
    @IBOutlet weak var selectView: UIView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var ContinerView: UIView!
    @IBOutlet weak var emptyImaage: UIImageView!
    
    //MARK: - VIEWDIDLOAD
    var anmilNameArray = [[String]]()
    var anmilIDArray = [Int]()
    
    
    
    var TretmintSelected = [Int]()
    var allMediciens = [Int]()
    
    
    
    var anmilSelected = [Int]()
    var delegate:setSelectedTretmintID!
    var presenter : SendTreatmentpresenter!
    var isSelected = false
    var id = ""
    var isComeFromMore = false
    var isComeFromChat = false
    var roomId = 0
    var userId = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("===================== user id , room id ")
        print(allMediciens)
        print(userId)
        print(roomId)
    
        
        
        self.emptyImaage.isHidden = true
        ConfirmOutlet.AddTOPCorners(num: 20)
        presenter = SendTreatmentpresenter(view: self)
        SetUpTableview()
        presenter.viewDidLoad()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.ContinerView.isHidden = true
        
    }
    //MARK: - IBACTIONS
    @IBAction func ConfirmButton(_ sender: UIButton) {
        self.presenter.SetSelectedTretmentArray()
      
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
        
    }
    @IBAction func selectFromSheet(_ sender: UIButton) {
    
        McPicker.showAsPopover(data: anmilNameArray, fromViewController: self, sourceView: sender, doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                self?.selectTextField.text = name
                self?.anmilSelected.append(self?.anmilIDArray[self?.anmilNameArray[0].index(of: name) ?? 0] ?? 0)
                self?.presenter.getMedisins(animalsArray: self!.anmilSelected)
                self?.anmilSelected.removeAll()
                self?.ContinerView.isHidden = true
            }
        }, cancelHandler: { () -> Void in
            print("Canceled Popover")
        }, selectionChangedHandler: { (selections: [Int:String], componentThatChanged: Int) -> Void  in
            let newSelection = selections[componentThatChanged] ?? "Failed to get new selection!"
            print("Component \(componentThatChanged) changed value to \(newSelection)")
        })
        
       
    }
    
    
    
    @IBAction func AddButton(_ sender: UIButton) {
        if isSelected == true {
        sender.backgroundColor = #colorLiteral(red: 0.8196078431, green: 0.8196078431, blue: 0.8392156863, alpha: 1)
            isSelected = false
            
        } else {
            sender.backgroundColor = UIColor(named: "BaseColour")
            isSelected = true
        }
    }
    
    @IBAction func searchDidChange(_ sender: Any) {
        presenter.SearchMedisn(text: self.searchTextField.text ?? "")
    }
    
    
}
