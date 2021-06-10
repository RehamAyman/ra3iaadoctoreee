//
//  AboutAppVCPresnter.swift
//  Ra3ia
//
//  Created by Sara Mady on 13/04/2021.
//

import Foundation
//MARK:- protocols

protocol ApoutAppView : class {
    
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func setAboutAppData(about:String)
}

//MARK:- presenter class
    
class  AboutAppVCPresnter {
    
    //MARK:- 1 variabals
    private weak var view : ApoutAppView?
    
    //MARK:- 2 view initionalizer
    
    init(view : ApoutAppView) {
        self.view = view
    }
    func viewWillApper(){
        getAboutData()
    }
    func getAboutData(){
        view?.showIndicator()
        TabBarinteractor.about.send(AboutAppModel.self){
            [weak self] (response) in
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                self.view?.setAboutAppData(about: value.data.about)
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
}
