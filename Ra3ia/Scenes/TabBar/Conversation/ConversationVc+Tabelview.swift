//
//  ConversationVc+Tabelview.swift
//  Ra3ia
//
//  Created bySara Mady on 3/22/21.
//

import UIKit

extension ConversationsVC : UITableViewDelegate , UITableViewDataSource {
    
    
    func SetUpTableview () {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "ConversationReqCell", bundle: nil), forCellReuseIdentifier: "ConversationReqCell")
        self.tableview.tableFooterView = UIView()

    }
    
    //MARK: - TABLE VIEW METHODS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if SegementOutlet.selectedSegmentIndex == 0 {
             return  presenter.getCountOfOpningMessages()
        } else  {
            return  presenter.getCountOfFinshedMessages()
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "ConversationReqCell", for: indexPath) as! ConversationReqCell
        
        
        
        if SegementOutlet.selectedSegmentIndex == 0 {
            presenter.configureOpenningMessages(cell: cell, for: indexPath.row)
            
            
            
        }else  {
            presenter.configureFinshedgMessages(cell: cell, for: indexPath.row)
            
            
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        if SegementOutlet.selectedSegmentIndex == 0 {
            presenter.didSelectRow(index: indexPath.row)
            
            print(indexPath.row)
            
            
        }
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
       
        
        print(indexPath.row)
        
        
       
    }
    
    
}
