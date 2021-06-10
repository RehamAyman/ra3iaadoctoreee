//
//  editRecipesVCpresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import Foundation
import ViewAnimator
import SKActivityIndicatorView


extension EditRecVC :editRecipesView {
    func UpdateTable() {
        self.tableview.reloadData()
        self.tableview.beginUpdates()
        self.tableview.endUpdates()
    }
    
    func setSingleRespsData(singlePrescription: singlePrescriptionData) {
        self.orderId.text =  "Order Number".localized + " " + String(singlePrescription.id)
        self.numberOdProuduct.text =  "Number of products :".localized + " " + String(singlePrescription.totalQty)
        self.orderDate.text =   "Order Date :".localized + " " + singlePrescription.createdAt
        self.orderCost.text = "Order Cost :".localized + singlePrescription.totalPrice + " " + "SR".localized
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
        tableview.tableFooterView = UIView()
    }
    func DelteMedisnt(name: String, index: Int) {
        
        let alert = UIAlertController(title: "Delete Treatment".localized, message: "Are you sure you want to delete  \(name) ?".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK".localized, style: .default, handler: { action in
            self.presenter.remove(for: index)
           
        }))
        alert.addAction(UIAlertAction(title: "Cancel".localized, style: .cancel, handler: { action in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func DeleteFromTabele(productID: Int) {
       self.DeletedArray.append(productID)
    }
    
    func showSuccessMssge(msg: String) {
        showSuccessAlert(title: "", message: msg)
        self.navigationController?.popViewController(animated: true)
    }
    
}


