//
//  notificati.swift
//  Ra3ia
//
//  Created bySara Mady on 3/28/21.
//

import Foundation
import SKActivityIndicatorView
extension notificationsVC : NotificatonView {
    func fetchingDataSuccess() {
        self.tableview.reloadData()
    }
    
    func SetUpTableview() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        tableview.tableFooterView?.isHidden = true
        tableview.backgroundColor = UIColor.clear
        
    }
    
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func DidSelct(id: Int) {
        print("Hello")
    }
    
    
   
    
    
}
