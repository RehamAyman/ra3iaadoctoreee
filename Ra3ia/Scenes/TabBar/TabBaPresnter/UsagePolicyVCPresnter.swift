//
//  UsagePolicyVCPresnter.swift
//  Ra3ia
//
//  Created by Sara Mady on 13/04/2021.
//

import Foundation
//MARK:- protocols

protocol UsagePolicyView : class {
    
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func setUsagePolicyData(usgePolcy:String)
}

//MARK:- presenter class

class  UsagePolicyVCPresnter {
    
    //MARK:- 1 variabals
    private weak var view : UsagePolicyView?
  
    //MARK:- 2 view initionalizer
    
    init(view : UsagePolicyView) {
        self.view = view
    }
    func viewWillApper(){
        getAgreamentsData()
    }
    func getAgreamentsData(){
        view?.showIndicator()
        TabBarinteractor.agreaments.send(AgreamentsModel.self){
            [weak self] (response) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                
                self.view?.setUsagePolicyData(usgePolcy: value.data.agreaments)
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
   
   
}
