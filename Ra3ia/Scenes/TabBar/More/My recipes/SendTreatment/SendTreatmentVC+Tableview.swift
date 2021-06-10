//
//  SendTreatmentVC+Tableview.swift
//  Ra3ia
//
//  Created bySara Mady on 3/24/21.
//

import UIKit



extension SendTreatmentVC : UITableViewDelegate , UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getcellsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "TreatmentCell", for: indexPath) as! TreatmentCell
        presenter.configureTreatmentCells(cell: cell, for: indexPath.row)
        cell.selectionStyle = .none
        cell.toogleAction = {
            self.presenter.selectTreatment(index: indexPath.row)
        }
        
        return cell
        
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    
    
    
    
    
    
    
}
