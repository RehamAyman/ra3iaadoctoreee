//
//  myRecipesVC+presenterDelegate.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import Foundation
import ViewAnimator
import SKActivityIndicatorView

extension MyRecipesVC : myRecipesView {
    
    func DidSelct(id: Int) {
        
        let vc = Storyboard.Main.viewController(EditRecVC.self)
        vc.id = id
        self.navigationController?.pushViewController(vc, animated: true)
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
    
    func fetchingDataSuccess() {
        self.tableview.reloadData()
        let fromAnimation = AnimationType.vector(CGVector(dx: 40, dy: 0))
        UIView.animate(views: tableview.visibleCells, animations: [fromAnimation], duration: 0.8 )
    }
    
    func SetUpTableview() {
        tableview.delegate = self
        tableview.dataSource = self
    }

    

}
