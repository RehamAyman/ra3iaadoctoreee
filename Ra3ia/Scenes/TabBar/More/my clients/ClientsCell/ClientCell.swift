//
//  ClientCell.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit
import Cosmos

class ClientCell: UITableViewCell , ClientCellsView{
  
    //MARK: - OUTLETS

    @IBOutlet weak var ClientRate: CosmosView!
    @IBOutlet weak var ClientName: UILabel!
    @IBOutlet weak var ClientImage: UIImageView!
    
    //MARK: - cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ClientImage.MakeRounded()
        selectionStyle = .none
        
        
    }
    

    //MARK: - presenter protocols

    func displayClientImage(image: String) {
        self.ClientImage.setImageWith(image)
      }
      
      func setRates(Rate: String) {
        self.ClientRate.rating = Double(Rate) ?? 0.0
      }
      
      func SetClientName(name: String) {
        self.ClientName.text = name
      }
    

   

}
