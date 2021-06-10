//
//  ComplaintsVCPresnter.swift
//  Ra3ia
//
//  Created by Sara Mady on 13/04/2021.
//

import Foundation
//MARK:- protocols

protocol ComplaintsView : class {
    
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func showSuccessMessga(msg:String)
    func showComplateData(msg:String)
}

//MARK:- presenter class
    
class  ComplaintsVCPresnter {
    
    //MARK:- 1 variabals
    private weak var view : ComplaintsView?
    
    //MARK:- 2 view initionalizer
    
    init(view : ComplaintsView) {
        self.view = view
    }
   
    func SendCompliment(subject:String,content:String){
        view?.showIndicator()
        TabBarinteractor.contactUs(type: "complaint", subject: subject, content: content).send(DefaultResponse.self){
            [weak self] (response) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                self.view?.showSuccessMessga(msg: value.msg ?? "")
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    func CheckData(subject:String,content:String){
        if(subject == "" || content == ""){
            self.view?.showComplateData(msg: "Please enter the Title and Content".localized)
        }else{
            self.CheckData(subject: subject, content: content)
        }
    }
}
