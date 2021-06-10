//
//  ClientVC+tableview.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit
extension MyClientsVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if SegementOutlet.selectedSegmentIndex == 0 {
          
            return presenter.getNewClientsCount()
        }else {
            return presenter.getFinshedClientsCount()
           
        }
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "ClientCell", for: indexPath) as! ClientCell
        if SegementOutlet.selectedSegmentIndex == 0 {
            presenter.configureCurrentCells(cell: cell, for: indexPath.row)
            
            return cell
        }else {
            presenter.ConfigureFinshedCells(cell: cell, for: indexPath.row)
            
            return cell
            
        }
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    
    
    
}
