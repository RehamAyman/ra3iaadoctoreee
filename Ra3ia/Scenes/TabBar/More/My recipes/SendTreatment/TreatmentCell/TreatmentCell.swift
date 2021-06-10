//
//  TreatmentCell.swift
//  Ra3ia
//
//  Created bySara Mady on 3/24/21.
//

import UIKit

class TreatmentCell: UITableViewCell  , TreatmentCellView {
  
    
    
    @IBOutlet weak var treatmentName: UILabel!
    @IBOutlet weak var treatmentPrice: UILabel!
    @IBOutlet weak var PlusButton: UIButton!
    var toogleAction : (()->())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setTreatmentName(name: String) {
        self.treatmentName.text = name
    }
    func setCost(cost: String) {
        self.treatmentPrice.text = cost  + "SR".localized
    }
    @IBAction func BlusAction(_ sender: UIButton) {
        toogleAction?()
    }
    func setButtonImage(isSelected: String) {
        if (isSelected == "true"){
            self.PlusButton.setImage(#imageLiteral(resourceName: "checkmark"), for: .normal)
            self.PlusButton.backgroundColor = UIColor.clear
        }else{
            self.PlusButton.setImage(#imageLiteral(resourceName: "pluss").withTintColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), for: .normal)
            self.PlusButton.backgroundColor = UIColor.BasicColor

        }
    }
    
}
