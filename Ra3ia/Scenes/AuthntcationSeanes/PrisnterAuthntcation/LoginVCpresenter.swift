//
//  LoginPresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/25/21.
//

import Foundation
protocol LoginView : class {
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func LoginToApplication(type:String)
    func setPaddingToTextFeild()
    func goToRegister()

}
class  LoginVCpresenter {
    
    //MARK:- 1 variabals
    
    private weak var view : LoginView?
    var utils = AppUtils()

    //MARK:- 2 view initionalizer
    
    init(view : LoginView) {
        self.view = view
    }

    func viewDidLoad(){
        
        view?.setPaddingToTextFeild()
    }
    
    func LoginUser(phoneoremail:String,password:String,device_id:String,device_type:String){
        view?.showIndicator()
        AuthntcationInteractor.Login(phoneoremail: phoneoremail, password: password, device_id: device_id, device_type: device_type, app_type: "doctor").send(AuthResponse.self){
            [weak self] (response) in

            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):

                print("failure\(String(describing: error))")
            case .success(let value):
                
                

                if(value.data.status == "not_active"){
                    
                    print("============")
                    KeyChain.userToken = value.data.token
                    self.view?.LoginToApplication(type: "doctor")
                    
                    
                }else{
                    print("Loooogin🤍🤍🤍")
                      KeyChain.userToken = value.data.token
                      User.currentUser = value.data
                    self.view?.LoginToApplication(type: User.currentUser?.accType ?? "")
                }



            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }

    }

    
    
    
    func cheackValidData(mobile:String,password:String,device_id:String) {
        
        if(mobile != "" && password != ""){
          
                self.LoginUser(phoneoremail:mobile, password: password, device_id: device_id, device_type: "ios")
        }else{
           
            completData(title: "", message: "Please enter the Mobile number  and password".localized)
        }
        
    }
  
}

