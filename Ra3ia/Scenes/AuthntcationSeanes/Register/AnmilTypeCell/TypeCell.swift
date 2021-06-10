//
//  TypeCell.swift
//  Ra3ia
//
//  Created bySara Mady on 3/31/21.
//

import UIKit
import BEMCheckBox

class TypeCell: UICollectionViewCell , RegisterTypeCellView{
  

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var checkBox: BEMCheckBox!
    var id = 0
    var selectType:(()->())?
   
    override func awakeFromNib() {
        super.awakeFromNib()
        checkBox.boxType = .square
        checkBox.isSelected = true
       
    }
    func setType ( Type : anmil) {
        self.typeLabel.text! = Type.name
    }
    
    func setId(id: Int) {
        self.id = id
    }
    
    @IBAction func checkBoxAction(_ sender: BEMCheckBox) {
        if checkBox.isSelected == true {
            checkBox.isSelected = false
         //   self.selectType?()
          // sender.isUserInteractionEnabled = false
            
        }else{
            checkBox.isSelected = true
        }
        
    }
    
    
    
}
