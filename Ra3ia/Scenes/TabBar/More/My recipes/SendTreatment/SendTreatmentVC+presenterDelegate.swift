//
//  SendTreatmentVC+presenterDelegate.swift
//  Ra3ia
//
//  Created bySara Mady on 3/24/21.
//

import UIKit
import SKActivityIndicatorView
import ViewAnimator


extension SendTreatmentVC : SendTreatmentView {
    func showSuccessMssge(msg: String) {
        showSuccessAlert(title: "", message: msg)
        self.navigationController?.popViewController(animated: true)
        self.delegate.setSelectedTretmintID()
    }
    
    func showSuccesssMsg ( msg : String) {
        showSuccessAlert(title: "", message: msg)
    }
    
    func ReloadTableView() {
        self.tableview.reloadData()
    }
    func fetchingDataSuccess() {
        self.ContinerView.isHidden = false
        self.tableview.reloadData()
        let fromAnimation = AnimationType.vector(CGVector(dx: 40, dy: 0))
        UIView.animate(views: tableview.visibleCells, animations: [fromAnimation], duration: 0.8 )
    }
    func SetUpTableview() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
    }
    func showIndicator(){
        SKActivityIndicator.show()
    }
    func hideIndicator(){
        SKActivityIndicator.dismiss()
    }
    func showError(error:String){
        showErrorAlert(title: "", message: error)
    }
    func SetAnmilData(AnmilsArray: [anmil]) {
        var anmilsName = [String]()
        for i in AnmilsArray{
            anmilsName.append(i.name)
            anmilIDArray.append(i.id)
        }
        
        self.anmilNameArray.append(anmilsName)
    }
   
    func ShowNoDataImage(){
        self.emptyImaage.isHidden = false
        
    }
    
    
    
    
    
    
    ///////
    func SetSelectedTreatmentID(treatmentsArray: [MedisnModel]) {
        for i in treatmentsArray{
            
        
            
            
        
            if(i.isSelected == "true"){
                self.TretmintSelected.append(Int(i.id) ?? 0)
                
                print("😅\(treatmentsArray[0].id)")
            }
            
            
        }
        
        
        
        if isComeFromChat == true {
            self.presenter.sendTreatment(user_id: self.userId, medicines: self.TretmintSelected, room_id: self.roomId )
        } else {
            self.presenter.UpdatePrescription(id: self.id, medicines: self.TretmintSelected, deletedmedicines: [])
        }
        
       
    }
    
    
}
