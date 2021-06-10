//
//  StaticsTableCell.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit

class StaticsTableCell: UITableViewCell , StaticsTabelCellView{
  
    
    
    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var lastMessage: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.UserImage.MakeRounded()
    }
    
    func setImage(image: String) {
        self.UserImage.setImageWith(image)
      }
      
      func SenderName(name: String) {
        self.userName.text! = name
        
      }
      func setdetails(details: String) {
        self.lastMessage.text = details
      }
    
    

}
