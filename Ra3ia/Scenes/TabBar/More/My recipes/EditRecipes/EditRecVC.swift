//
//  EditRecVC.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit

class EditRecVC : UIViewController, setSelectedTretmintID  {
    var presenter : editRecipesVCpresenter!

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var RispsImage: UIImageView!
    @IBOutlet weak var numberOdProuduct: UILabel!
    @IBOutlet weak var orderId: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    @IBOutlet weak var orderCost: UILabel!
    var id = 0
    var DeletedArray = [Int]()
    
    var Newmedicines = [Int]()
    
   // var selectedMedicien
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = editRecipesVCpresenter(view: self)
        SetUpTableview()
        presenter.viewDidLoad(id: self.id)
    }
    
    @IBAction func editButton(_ sender: UIButton) {
        let vc = Storyboard.Main.viewController(SendTreatmentVC.self)
        vc.delegate = self
        vc.id = String(self.id)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func BackButton(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Confirm(_ sender: UIButton) {
        presenter.UpdatePrescription(id: String(id), medicines: Newmedicines, deletedmedicines: DeletedArray)
    }
    
    func setSelectedTretmintID() {
        presenter.viewDidLoad(id: self.id)
    }
    
}
