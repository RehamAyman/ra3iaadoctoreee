//
//  addExperianceCell.swift
//  Ra3ia
//
//  Created bySara Mady on 4/1/21.
//

import UIKit

class addExperianceCell: UITableViewCell ,ExprincesCell{
    func setExprinc(exp: Experiences) {
        self.experianceLabel.text = exp.experience
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    @IBOutlet weak var experianceLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    
    @IBAction func deleteButton(_ sender: UIButton) {
       }


}
