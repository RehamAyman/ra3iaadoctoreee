//
//  forgetPasswordPresenter .swift
//  Ra3ia
//
//  Created bySara Mady on 4/26/21.
//

import Foundation
import Foundation

protocol  ForgetPasswordView : class {
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func showSuccess(msg:String)
    func GoToResetPasswordScreen()
    
}

class  ForgetPasswordPresnter {
    
    //MARK:- 1 variabals
    private weak var view : ForgetPasswordView?
    var utils = AppUtils()
    
    
    //MARK:- 2 view initionalizer
    init(view : ForgetPasswordView) {
        self.view = view
    }
    func viewDidLoad(){

    }
    
  
    func VerfyPhone(phone:String){
        view?.showIndicator()
        AuthntcationInteractor.ForgetPassword(phone: phone).send(DefaultResponse.self){
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
                   
                    self.view?.showSuccess(msg: "send verification code successfully .. ".localized)
                      self.view?.GoToResetPasswordScreen()
                
                }else{
                    self.view?.showError(error: value.key.localized)
                    
                    
                    
                }
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }

    }
    
    func cheackValidData(phone:String) {
        if(phone != "" ){
                self.VerfyPhone(phone: phone)
        }else{
            completData(title: "", message: "Please enter your mobile number ".localized)
        }
        
    }
  
}

