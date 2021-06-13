//
//  editRecipesPresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import Foundation
//MARK:- protocols

protocol editRecipesView : class {

    func fetchingDataSuccess()
    func setSingleRespsData(singlePrescription:singlePrescriptionData)
    func SetUpTableview()
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func DelteMedisnt(name:String,index:Int)
    func DeleteFromTabele(productID:Int)
    func showSuccessMssge(msg:String)
    func UpdateTable()
    func setALLmedicenInprescription (medicien : [Medicine])
}

// cells

protocol EditRecipesCellView {
    func setImage ( image : String)
    func setProductName ( name : String)
    func setAmount ( number : Int)
    func setCost ( cost : String)
}

//MARK:- presenter class

class  editRecipesVCpresenter {
    
    //MARK:- 1 variabals
    private weak var view : editRecipesView?
    var products = [Medicine]()
   
    //MARK:- 2 view initionalizer
    
    init(view: editRecipesView) {
        self.view = view
    }
    
    //MARK: - 3 class functions
    func viewDidLoad(id:Int){
        self.getRecipesData(id: id)
    }
    
    func configureEDITRecipesCells(cell: editRecipesCell , for index: Int) {
        cell.setImage(image: self.products[index].image)
        cell.setProductName(name: self.products[index].name)
        cell.setCost(cost: String(self.products[index].price))
    }
    func remove (for index : Int ){
        self.view?.DeleteFromTabele(productID: self.products[index].id)
        self.products.remove(at: index)
        self.view?.UpdateTable()
    }
    
    func showDeleteAlert(index:Int){
        self.view?.DelteMedisnt(name: self.products[index].name, index: index)
    }
    func getRecipesData(id:Int){
        view?.showIndicator()
        TabBarinteractor.doctorSinglePrescription(id: id).send(singlePrescriptionModel.self){
            [weak self] (response) in

            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                self.view?.setALLmedicenInprescription(medicien: value.data.medicines)
                self.products = value.data.medicines
                self.view?.setSingleRespsData(singlePrescription: value.data)
                self.view?.fetchingDataSuccess()
                print("unAuthorized")
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    func UpdatePrescription(id: String ,medicines:[Int],deletedmedicines:[Int]){
        view?.showIndicator()
        TabBarinteractor.updatePrescription(id: id, medicines: medicines, deletedmedicines: deletedmedicines).send(DefaultResponse.self){
            [weak self] (response) in

            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                self.view?.showSuccessMssge(msg: value.msg ?? "")
              
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    
    
   func getcellsCount () -> Int {
        return products.count
    }
    

  
    

}
