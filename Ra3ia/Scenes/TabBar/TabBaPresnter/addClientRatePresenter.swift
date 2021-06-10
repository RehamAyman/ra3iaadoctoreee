//
//  addClientRatePresenter.swift
//  Ra3ia
//
//  Created by Reham Ayman on 6/10/21.
//

import Foundation
import Foundation

//MARK:- protocols

protocol addClientRateView : class {
    
   
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func backHome ()
    func showSuccess( msg : String)
}




//MARK:- presenter class

class AddClientRatePresenter {
    
    //MARK:- 1 variabals
    
    private weak var view : addClientRateView?
   
    
    
    
    
    //MARK:- 2 view initionalizer
    init(view: addClientRateView) {
        self.view = view
    }
    
   
    
    
    
    //MARK: - 3 class functions
  
  
    
    func addClientRate ( value : Int ,  id : Int )
    {
        view?.showIndicator()
        TabBarinteractor.addClientRate(seconduser_id: id , value: value ).send(DefaultResponse.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                
                
                self.view?.showSuccess(msg: value.msg ?? "" )
                self.view?.backHome()
             
               
                print("unAuthorized")
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
  

 

  
    

}
