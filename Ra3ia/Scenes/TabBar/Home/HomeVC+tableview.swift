//
//  ConversationVC+tableview.swift
//  Ra3ia
//
//  Created bySara Mady on 3/22/21.
//

import UIKit
extension HomeVC : UITableViewDelegate , UITableViewDataSource {
    
    func SetUpTableview () {
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(UINib(nibName: "ConversationReqCell", bundle: nil), forCellReuseIdentifier: "ConversationReqCell")
    }
    
    
    
    
    
    
    
    
    //MARK: - tableview methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        return presenter.getcellsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "ConversationReqCell", for: indexPath) as! ConversationReqCell
        presenter.configure(cell: cell, for: indexPath.row)
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter.gotoTextChat(index: indexPath.row)
    }
    
    
}
