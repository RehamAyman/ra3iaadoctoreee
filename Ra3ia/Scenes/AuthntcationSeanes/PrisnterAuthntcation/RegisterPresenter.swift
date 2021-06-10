//
//  RegisterPresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/24/21.
//

import Foundation

//MARK:- protocols

protocol RegisterView : class {
    
    func fetchingDataSuccess()
    func GoToVreficatinPage()
    func setupCollections ()
 
    func PresentSelectDate ()
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func showMsg(msg:String)
    func featchData ( data : Anmils)
    func showSuccess ( msg : String)
    func showWarningAlert ( msg : String)
    
    
}

// type collection cells

protocol RegisterTypeCellView {
    func setType ( Type : anmil)
    func setId ( id : Int)
    
}

protocol RegisterSpecializationCellView {
    func setSpecialization ( Specialization : anmil )
    func setID ( ID : Int)
}




//MARK:- presenter class

class  RegisterVCpresenter {
    
    //MARK:- 1 variabals
    
    
    private weak var view : RegisterView?
    //collection vars
    // replace with api struct arrays
    
    
    var Specializations = [anmil]()
    var Types = [anmil]()
    var utils = AppUtils.getObject()
    //MARK:- 2 view initionalizer
    
    init(view : RegisterView) {
        self.view = view
    }
    
    //MARK: - 3 class functions
    func viewDidLoad(){
        getAnmils()
        getSpechilest()
        
        self.view?.setupCollections()
    }
    
    func getAnmils(){
       self.Types.removeAll()
        view?.showIndicator()
        AuthntcationInteractor.animals.send(Anmils.self){
            [weak self] (response) in
           
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                
                print("failure\(String(describing: error))")
            case .success(let value):
                self.Types = value.data
                self.view?.fetchingDataSuccess()
                self.view?.featchData(data: value)
                
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    func getSpechilest(){
        self.Specializations.removeAll()
        view?.showIndicator()
        AuthntcationInteractor.specialties.send(Anmils.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                
                print("failure\(String(describing: error))")
            case .success(let value):
                self.Specializations = value.data
                self.view?.fetchingDataSuccess()
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    func RegisterNewDoctor(fname:String,lname:String,email:String,phone:String,birthday:String,password:String,specialties:String,animals:String){
        view?.showIndicator()
        AuthntcationInteractor.Register(fname: fname, lname: lname, email: email, phone: phone, birthday: birthday, password: password, device_id: AppDelegate.FCMTOKEN , device_type: "ios", acc_type: "doctor", specialties: specialties, animals: animals).send(RegisterModel.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
                
                
            case .failure(let error):
                
                print("failure\(String(describing: error))")
                print("======= error === ====== ")
                print(error)
                
            case .success(let value):
                KeyChain.userToken = value.data.token
                print("success to register ")
                self.view?.showSuccess(msg: value.msg)
                self.view?.GoToVreficatinPage()
                 case .errorResponse(let error):
                
                
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    
    
    func configpeclizationCells(cell: specCell , for index: Int) {
        cell.setSpecialization(Specialization: Specializations[index])
        cell.setID(ID: Specializations[index].id)
        
        
    }
    
    func configerTypeCells ( cell : TypeCell , for index : Int){
        cell.setType(Type: Types[index])
        cell.setId(id: Types[index].id)
    }
    
    func getTypesCellsCount () -> Int {
        return Types.count
    }
    func getSpecializationCellCount () -> Int {
        return Specializations.count
    }
    //specialties.count == 0 || animals.count == 0
    func cheackData(fname:String,lname:String,email:String,phone:String,birthday:String,password:String,specialties:String,animals:String){
        
        if(fname == "" || lname == "" || email == "" ||  phone == "" || birthday == "" || password == ""   ) {
            self.view?.showMsg(msg: "Please complete your data".localized)
        }else{
            if(utils.isValidEmail(testStr: email) == false) {
                            self.view?.showWarningAlert(msg: "Please enter the correct email format".localized)
                        }else if(utils.isValidMobileNumber(mobil: phone) == false ){
                            self.view?.showWarningAlert(msg: "Please enter the correct Mobile Number".localized)
                        }else if(utils.isValidpassword(password: password) == false ){
                            self.view?.showWarningAlert(msg: "The password must be at least 6 characters".localized)
                        }
                        if(utils.isValidEmail(testStr: email) == true && utils.isValidMobileNumber(mobil: phone) == true && utils.isValidpassword(password: password) == true){
                            
                            
                            self.RegisterNewDoctor(fname: fname, lname: lname, email: email, phone: phone, birthday: birthday, password: password, specialties: specialties, animals: animals)
                          
                        }
                    }
            
            
          
        }
    
    
    
    
    
}
