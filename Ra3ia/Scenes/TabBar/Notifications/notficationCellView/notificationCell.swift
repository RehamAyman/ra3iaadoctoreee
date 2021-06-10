//
//  notificationCell.swift
//  Ra3ia
//
//  Created by Sara Mady on 04/06/2021.
//

import UIKit

class notificationCell: UITableViewCell ,NotificatonCellView{
    @IBOutlet weak var notficationTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setTitle ( title : String){
        self.notficationTitle.text = title
    }

}
