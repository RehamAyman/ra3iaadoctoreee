//
//  ConversationReqCell.swift
//  Ra3ia
//
//  Created bySara Mady on 3/22/21.
//

import UIKit
import Cosmos

class ConversationReqCell: UITableViewCell , ConvCellView {
   
    
    //MARK: - OUTLETS
    
    @IBOutlet weak var SendingTime: UILabel!
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var SenderName: UILabel!
    @IBOutlet weak var messageContent: UILabel!
    @IBOutlet weak var Rate: CosmosView!
    
    
    //MARK: - CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        
        UserImage.MakeRounded()
        selectionStyle = .none
        self.Rate.isUserInteractionEnabled = false
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
    }

    
    
    //MARK: - presenter protocoles
    
    
    func displayImage(image: String) {
        self.UserImage.setImageWith(image)
       }
       
       func displayMessageContent(message: String) {
        self.messageContent.text = message
       }
       
       func setRates(Rate: Int) {
        self.Rate.rating = Double(Rate)
       }
       
       func SetSenderName(name: String) {
        self.SenderName.text = name
       }
       
       func SetSendingTime(time: String) {
        self.SendingTime.text = time
       }
}
