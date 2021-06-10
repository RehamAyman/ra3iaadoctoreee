//
//  ChatCellTableViewCell.swift
//  SeaTrips
//
//  Created by Sara Mady on 03/12/2020.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//

import UIKit

class ChatCellTableViewCell: UITableViewCell ,ChatCellView{
   
    @IBOutlet weak var messageText: UILabel!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageLeadingConstrin: NSLayoutConstraint!
    @IBOutlet weak var messageTrilingConstrin: NSLayoutConstraint!
    @IBOutlet weak var UserAvatar: UIImageView!
    @IBOutlet weak var secoundAvatat: UIImageView!
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.messageView.layer.cornerRadius = 5
        self.messageView.clipsToBounds = true
        self.selectionStyle = .none
        self.UserAvatar.layer.cornerRadius = 20
        self.UserAvatar.clipsToBounds = true
        self.secoundAvatat.layer.cornerRadius = 20
        self.secoundAvatat.clipsToBounds = true
    }
    
    func setImage(image: String, bool: Int) {
        if(bool == 1){
            self.UserAvatar.isHidden = false
            self.UserAvatar.setImageWith(image)
            self.secoundAvatat.isHidden = true
            
            self.leading.isActive = false
            self.trailing.isActive = false
            
            self.leading = NSLayoutConstraint(item: self.UserAvatar!, attribute: .leading, relatedBy: .equal, toItem: self.messageView, attribute: .trailing, multiplier: 1, constant: 5)
            
            self.trailing = NSLayoutConstraint(item: self.messageView, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: self.secoundAvatat, attribute: .trailing, multiplier: 1, constant: 5)
            
            self.trailing.isActive = true
            self.leading.isActive = true
            self.layoutIfNeeded()
        }else{
            self.secoundAvatat.isHidden = false
            self.secoundAvatat.setImageWith(image)
            self.UserAvatar.isHidden = true
            self.leading.isActive = false
            self.trailing.isActive = false
            self.leading = NSLayoutConstraint(item: self.UserAvatar!, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: self.messageView, attribute: .trailing, multiplier: 1, constant: 5)
            self.trailing = NSLayoutConstraint(item: self.messageView, attribute: .leading, relatedBy: .equal, toItem: self.secoundAvatat, attribute: .trailing, multiplier: 1, constant: 5)
            self.trailing.isActive = true
            self.leading.isActive = true
            self.layoutIfNeeded()
            
        }
    }
func setContent(msg: String) {
        self.messageText.text = msg
    }
    
}
