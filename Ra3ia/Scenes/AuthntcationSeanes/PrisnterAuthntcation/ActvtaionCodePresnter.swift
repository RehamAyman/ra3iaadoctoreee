//
//  ActvtaionCodePresnter.swift
//  Ra3ia
//
//  Created by Sara Mady on 05/04/2021.
//

import Foundation

protocol ActvtaionCodeView : class {
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func showSuccess(msg:String)
    func LoginToApplication(type:String)
    func showStatusalert(message: String )
    
    
}

class  ActvtaionCodePresnter {
    //MARK:- 1 variabals
    private weak var view : ActvtaionCodeView?
    var utils = AppUtils()
    //MARK:- 2 view initionalizer
    init(view : ActvtaionCodeView) {
        self.view = view
    }
    func viewDidLoad(){

    }
    
    func VerfyPhone(v_code:String){
        view?.showIndicator()
        AuthntcationInteractor.VerfyPhone(v_code: v_code).send(DefaultResponse.self){
            [weak self] (response) in

            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                
                if(value.code == 419){
                    self.view?.showError(error: value.msg ?? "")
                }else{
                    self.view?.showSuccess(msg: "You logged in successfully".localized)
                    
                }
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }

    }
    
    func resendCode(){
        view?.showIndicator()
        
        
        AuthntcationInteractor.resendCode.send(resendCodeModel.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                
                print("failure\(String(describing: error))")
            case .success(let value):
            
                self.view?.showStatusalert(message: "resend code successfully ".localized )
              
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    
    
    
    func cheackValidData(vrefcationCode:String) {
        if(vrefcationCode != "" ){
                self.VerfyPhone(v_code: vrefcationCode)
        }else{
            completData(title: "", message: "Please enter the Vrefication Code".localized)
        }
        
    }
  
}

