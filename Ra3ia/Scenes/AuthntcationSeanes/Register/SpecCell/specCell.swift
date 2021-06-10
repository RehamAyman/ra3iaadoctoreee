//
//  specCell.swift
//  Ra3ia
//
//  Created bySara Mady on 3/31/21.
//

import UIKit
import BEMCheckBox

class specCell: UICollectionViewCell,RegisterSpecializationCellView {
  
    
    
    @IBOutlet weak var specLabel: UILabel!
    @IBOutlet weak var checkBox: BEMCheckBox!
    var id = 0 
    var selectSpec:(()->())?
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
      }
    
    func setSpecialization(Specialization: anmil) {
        self.specLabel.text! = Specialization.name
    }
    
    
    func setID(ID: Int) {
        self.id = ID
    }
    
    @IBAction func checkBoxAction(_ sender: BEMCheckBox) {
        if sender.on == true {
            self.selectSpec?()
           sender.isUserInteractionEnabled = false
            
        }
        
    }
    
}
