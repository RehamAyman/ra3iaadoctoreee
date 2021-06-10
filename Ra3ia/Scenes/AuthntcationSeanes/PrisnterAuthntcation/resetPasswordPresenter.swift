//
//  resetPasswordPresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 4/26/21.
//

import Foundation
// protocols

protocol resetPasswordView : class {
    func makeRoundBtn()
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func showSuccess(msg:String)
    func goToLoginScreen()
    
}


class resetPasswordPresenter {
    
    //MARK:- 1 variabals
    private weak var view : resetPasswordView?
    var utils = AppUtils()
    
    
    //MARK:- 2 view initionalizer
    init(view : resetPasswordView) {
        self.view = view
    }
    func viewDidLoad(){
        self.view?.makeRoundBtn()

    }
    
  
    func resetPassword (phone:String , NewPassword : String , v_code : String ){
        view?.showIndicator()
        AuthntcationInteractor.resetPassword(phone: phone, v_code: v_code, password: NewPassword).send(DefaultResponse.self){
            [weak self] (response) in

            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                
                if(value.code == 200 ){
                   
                    self.view?.showSuccess(msg: value.msg?.localized ?? "" )
                      self.view?.goToLoginScreen()
                
                }else{
                    self.view?.showError(error: value.msg?.localized ?? "" )
                    
                    
                    
                }
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }

    }
    
    func cheackValidData(phone:String , password : String , newPassword : String , v_code : String) {
        if(phone != "" || password != "" || newPassword != "" || v_code != "" ){
            
            if ( password != newPassword  ) {
                
                showWarningAlert(title: "", message: "Password and confirm password must be match. ".localized)
                
            } else {
                
                self.resetPassword(phone: phone, NewPassword: newPassword, v_code: v_code)
            }
            
        }else{
          
            completData(title: "", message: "a field value has been left Blank ".localized)
        }
        
    }
  

    
    
    
}
