//
//  EditRecipesVC+tableview.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit
extension EditRecVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getcellsCount()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "editRecipesCell", for: indexPath) as! editRecipesCell
        
        presenter.configureEDITRecipesCells(cell: cell, for: indexPath.row)
        cell.toogleAction = {
            self.presenter.showDeleteAlert(index: indexPath.row)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}








