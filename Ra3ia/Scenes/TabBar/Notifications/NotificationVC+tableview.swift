//
//  notrication+UITableView.swift
//  Ra3ia
//
//  Created by Sara Mady on 01/06/2021.
//

import UIKit
extension notificationsVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presnter.getcellsCount()
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! notificationCell
        
        if indexPath.row % 2 == 0 {
            cell.contentView.backgroundColor = #colorLiteral(red: 0.9336380959, green: 0.9130294323, blue: 0.9501001239, alpha: 1)
            cell.notficationTitle.textColor = UIColor(named: "BaseColour")

        } else if indexPath.row % 2 != 0 {
            cell.contentView.backgroundColor = .white
            cell.notficationTitle.textColor = .darkGray
          }
        presnter.configureRecipesCells(cell: cell, for: indexPath.row)
        return cell
        
        
    }
  
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    
}
