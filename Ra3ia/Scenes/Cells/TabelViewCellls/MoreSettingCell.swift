//
//  MoreSettingCell.swift
//  Ra3ia
//
//  Created bySara Mady on 3/21/21.
//

import UIKit

class MoreSettingCell: UITableViewCell , MoreCellsView {
 
    
// MARK:- outlets
    
    @IBOutlet weak var Cellimage: UIImageView!
    @IBOutlet weak var MainLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    //MARK:- cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    //MARK:- presenter protocols
    
    
    func displayMainLabel(name: String) {
        self.MainLabel.text = name
     }
     
     func displayDetails(name: String) {
        self.detailsLabel.text = name
     }
     
     func displayImage(image: String) {
        self.Cellimage.image = UIImage(named: image)
     }

    

   

}
