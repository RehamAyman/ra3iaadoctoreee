//
//  PersonalInfoVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/22/21.
//

import UIKit

class PersonalInfoVC: UIViewController {
    
    
 //   var ExperianseArray = [Experiences]()
    
    var presenter : PersonalInfoVCpresenter!
    //MARK: - OUTLETS
    
    @IBOutlet weak var typeHeight: NSLayoutConstraint!
    @IBOutlet weak var specHeight: NSLayoutConstraint!
    @IBOutlet weak var phonNumber: EditableTextField!
    @IBOutlet weak var email: EditableTextField!
    @IBOutlet weak var userNAme: EditableTextField!
    @IBOutlet weak var addTableview: UITableView!
    @IBOutlet weak var uesrImage: UIImageView!
    @IBOutlet weak var confirmbtnOutlet: UIButton!
    @IBOutlet weak var specCollectionView: UICollectionView!
    @IBOutlet weak var typeCollectionView: UICollectionView!
    @IBOutlet weak var newEXpTxtField: EditableTextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var cv: EditableTextField!
    @IBOutlet weak var doctoExprice: EditableTextField!
    
    
    //MARK: - cycle
   
    override func viewDidLoad() {
        super.viewDidLoad()
                self.addTableview.isHidden = false
        setUpTabel()
        setupCollections()
        self.uesrImage.MakeRounded()
        self.confirmbtnOutlet.AddTOPCorners(num: 25)
        presenter = PersonalInfoVCpresenter(view: self)
        presenter.getUserData()
        
        
        print("========= personal array ")
        
      //  print(ExperianseArray)

     
    }
    //MARK: - IBActions

   
    @IBAction func confirmButton(_ sender: UIButton) {
        
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addNewExp(_ sender: UIButton) {

//        if newEXpTxtField.text?.isEmpty == false {
//            ExperianseArray.append(newEXpTxtField.text!)
//            let indexpatth = IndexPath(row: ExperianseArray.count - 1 , section: 0 )
//            addTableview.beginUpdates()
//            addTableview.insertRows(at: [indexpatth], with: .automatic)
//            addTableview.endUpdates()
//            newEXpTxtField.text = ""
//        }
        
        
        
        
    }
    
    
}
