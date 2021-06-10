//
//  personalInfo+tableview.swift
//  Ra3ia
//
//  Created bySara Mady on 4/1/21.
//

import UIKit
extension PersonalInfoVC : UITableViewDelegate , UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return presenter.getExperiencesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addTableview.dequeueReusableCell(withIdentifier: "addExperianceCell", for: indexPath) as! addExperianceCell
        presenter.configerExpriceCell(cell: cell, for: indexPath.row)
        return cell
    }
    
    
}
