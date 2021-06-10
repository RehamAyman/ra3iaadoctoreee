//
//  myRecipesVc+tableview.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit

extension MyRecipesVC : UITableViewDelegate  , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getcellsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "RecipesCell", for: indexPath) as! RecipesCell
        cell.selectionStyle = .none
        presenter.configureRecipesCells(cell: cell, for: indexPath.row)
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRow(index: indexPath.row)
        
        
    }
    
    
    
    
    
    
}
