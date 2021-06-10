//
//  staticVc+presenterDelegate.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import Foundation
import ViewAnimator
import SKActivityIndicatorView
extension staticksVC : staticksView {
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    
    func FeatchData() {
        self.collectionview.reloadData()
        tableview.reloadData()
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func setup() {
        
        collectionview.delegate = self
        collectionview.dataSource = self
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
    }
     func fetchingDataSuccess() {
        tableview.reloadData()
        animateView()
    }
    
    func animateView(){
        let ANIMATION = AnimationType.zoom(scale: 0.2)
        let fromAnimation = AnimationType.vector(CGVector(dx: 30, dy: 0))
        UIView.animate(views: tableview.visibleCells, animations: [fromAnimation, ANIMATION], duration: 0.8 )
    }
          
          

}
