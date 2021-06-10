//
//  RecipesCell.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit

class RecipesCell: UITableViewCell , RecipesCellView{
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var requestNum: UILabel!
    @IBOutlet weak var requestDate: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var ProdutsNum: UILabel!
    
    
    //MARK: - CYCLE
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    //MARK: - PRESENTER PROTOCOL
  

    func setDateOfRequests(date: String) {
        self.requestDate.text =  "Order Date :".localized + " " + date
    }
    
    func setProductsNum(num: String) {
        ProdutsNum.text! = "Number of products :".localized + " " + num
    }
    
    func setCost(cost: String) {
        self.cost.text! =  "Order Cost :".localized + cost + " " + "SR".localized
    }
    
    func RequestNum(num: String) {
        self.requestNum.text! = "Order Number".localized + " " + num
    }
    
}
