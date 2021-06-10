//
//  MyclientVC+presenterDelegate.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import UIKit
import SKActivityIndicatorView
import ViewAnimator

extension MyClientsVC : MYclientsView {
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    
    func fetchingDataSuccess() {
      
        self.animateView()
    }
    
    func SetUpTableview() {
        tableview.delegate = self
        tableview.dataSource = self
       
    }
    
    func animateView () {
        tableview.reloadData()
        let fromAnimation = AnimationType.vector(CGVector(dx: 40, dy: 0))
        UIView.animate(views: tableview.visibleCells, animations: [fromAnimation], duration: 0.8 )
    }
    
    
    
    
}
