//
//  editRecipesCell.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit

class editRecipesCell: UITableViewCell , EditRecipesCellView {
    @IBOutlet weak var MedisnImage: UIImageView!
    @IBOutlet weak var MedisnName: UILabel!
    @IBOutlet weak var MedisnPrice: UILabel!
    
    var toogleAction : (()->())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    //MARK: - cell protocols
    
    func setImage(image: String) {
        self.MedisnImage.setImageWith(image)
    }
    
    func setProductName(name: String) {
        self.MedisnName.text = name
    }
    
    func setAmount(number: Int) {
        
    }
    func setCost(cost: String) {
        self.MedisnPrice.text = cost + " "  + "SR".localized
    }
    
    //MARK: - actions
    
    @IBAction func DeleteAction(_ sender: Any) {
        toogleAction?()
    }
}
