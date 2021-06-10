//
//  myRecipesPresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import Foundation
//MARK:- protocols

protocol myRecipesView : class {
    
    func fetchingDataSuccess()
    func SetUpTableview()
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func DidSelct(id:Int)
}

// cells

protocol RecipesCellView {
  
    func setDateOfRequests ( date : String)
    func setProductsNum ( num : String)
    func setCost (cost : String)
    func RequestNum ( num : String)
  
  
  
}

//MARK:- presenter class

class  myRecipesVCpresenter {
    
    //MARK:- 1 variabals
    
    private weak var view : myRecipesView?
    var PrescriptionArray = [Prescription]()
    //MARK:- 2 view initionalizer
    
    init(view: myRecipesView) {
        self.view = view
    }
    
    func viewWillApper(){
        self.PrescriptionArray.removeAll()
        self.view?.fetchingDataSuccess()
        self.getRecipesData()
    }
    
    
    
    //MARK: - 3 class functions
  
    func configureRecipesCells(cell: RecipesCell, for index: Int) {
        cell.RequestNum(num: String(self.PrescriptionArray[index].id))
        cell.setCost(cost: self.PrescriptionArray[index].totalPrice)
        cell.setDateOfRequests(date: self.PrescriptionArray[index].createdAt)
        cell.setProductsNum(num: String(self.PrescriptionArray[index].totalQty))
    }
    
    func getRecipesData(){
        view?.showIndicator()
        TabBarinteractor.doctorPrescriptions.send(DoctorPrescriptionsModel.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                self.PrescriptionArray = value.data
                self.view?.fetchingDataSuccess()
                print("unAuthorized")
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
  
    
    func didSelectRow(index:Int){
        self.view?.DidSelct(id: self.PrescriptionArray[index].id)
    }
    
    
    func getcellsCount () -> Int {
        return PrescriptionArray.count
    }
    

  
    

}
