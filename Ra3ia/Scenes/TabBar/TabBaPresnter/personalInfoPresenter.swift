//
//  personalInfoPresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/30/21.
//

import Foundation

//MARK:- protocols

protocol PersonalInfoView : class {
    
    func fetchingDataSuccess()
    func setupCollections ()
    func setUpTabel()
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func setPersonalData(personalData:personalInfoData)
    func showSuccess ( msg : String)
}

protocol ExprincesCell : class {
    func setExprinc(exp:Experiences)

}

//MARK:- presenter class

class PersonalInfoVCpresenter {
    
    //MARK:- 1 variabals
    
    
    private weak var view : PersonalInfoView?
    
    
    
    
    private var Spec = [ anmil]()
    private var Types = [anmil]()
    private var ExprincsArray = [Experiences]()

    
    //MARK:- 2 view initionalizer
    
    init(view : PersonalInfoView) {
        // personalinfo view controller
        self.view = view
    }
    
    //MARK: - 3 class functions
    func getNumberOfSep()->Int{
        return self.Spec.count
    }
    
    func getNumberOfTypes()->Int{
        return self.Types.count
    }
   
    func getUserData(){
        self.ExprincsArray.removeAll()
        self.Spec.removeAll()
        self.Types.removeAll()
        
        view?.showIndicator()
        TabBarinteractor.profile.send(personalInfoModel.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                self.Spec = value.data.specialties
                self.Types = value.data.animals
                self.ExprincsArray = value.data.experiences
                self.view?.setPersonalData(personalData: value.data)
                self.view?.fetchingDataSuccess()
                print("unAuthorized")
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }

    
    func updateProfile (fname: String, lname: String, email: String, phone: String, birthday: String, specialties: String, animals: String, experiences: [String], bio: String){
        
        view?.showIndicator()
        TabBarinteractor.updateProfile(fname: fname, lname: lname, email: email, phone: phone, birthday: birthday, specialties: specialties, animals: animals, experiences: experiences, bio: bio ).send(updateProfileModel.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                self.view?.showSuccess(msg: value.msg)
               
             
                print("unAuthorized")
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    func configerExpriceCell(cell:addExperianceCell, for index:Int){
        cell.setExprinc(exp: self.ExprincsArray[index])
    }
    func configerTypeCells ( cell : TypeCell , for index : Int){
        cell.setId(id: self.Types[index].id)
        cell.setType(Type: self.Types[index])
    }
    func ConfigerSepCell( cell : specCell , for index : Int){
        cell.setSpecialization(Specialization: self.Spec[index])
        cell.setID(ID: self.Spec[index].id)
    }
    func getExperiencesCount () -> Int {
        return ExprincsArray.count
    }
    func getTypesCellsCount () -> Int {
        return Types.count
    }
    
    func getSpecializationCellCount () -> Int {
        return Spec.count
    }
    
    
    
    
    
    
}
