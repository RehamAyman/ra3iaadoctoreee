//
//  SendTreatmentPresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/24/21.
//
import Foundation
import Alamofire
import UIKit
//MARK:- protocols

protocol SendTreatmentView : class {
    func ReloadTableView()
    func ShowNoDataImage()
    func fetchingDataSuccess()
    func SetUpTableview()
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func SetAnmilData(AnmilsArray:[anmil])
    func SetSelectedTreatmentID(treatmentsArray:[MedisnModel])
    func showSuccessMssge(msg:String)
    func showSuccesssMsg ( msg : String)
   
}

protocol TreatmentCellView {
    func setTreatmentName ( name : String)
    func setCost ( cost : String)
    func setButtonImage(isSelected:String)
}
//MARK:- presenter class

class  SendTreatmentpresenter {
    
    //MARK:- 1 variabals
    private weak var view : SendTreatmentView?
    var treatmentsArray = [MedisnModel]()
    var treatmentsSearchArray = [MedisnModel]()
    var AnmilsArray = [anmil]()
    var selectedTretmentArray = [Int]()
    func viewDidLoad(){
        getAnmils()
    }
    
    func SearchMedisn(text:String){
        var filteredData:[MedisnModel] = []
        filteredData.append(contentsOf: treatmentsSearchArray.filter { $0.name.lowercased().contains(text.lowercased())})
        treatmentsArray = filteredData
        self.view?.fetchingDataSuccess()
        if filteredData.isEmpty {
            self.treatmentsArray .removeAll()
            self.treatmentsArray = treatmentsSearchArray
            self.view?.fetchingDataSuccess()
        }
        
    }
    func getAnmils(){
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
                self.AnmilsArray = value.data
                self.view?.SetAnmilData(AnmilsArray: value.data)
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    func getMedisins(animalsArray:[Int]){
        view?.showIndicator()
        let params:Parameters = [
            "animals":"[\(animalsArray)]"
        ]
        API.GetAPIWithHeader(url: "https://raaia.4hoste.com/api/medicines", Parameters:params, Headers: ["Authorization":"Bearer \(KeyChain.userToken ?? "")"]) { (success, value) in
            if success {
                self.treatmentsArray.removeAll()
                self.view?.ReloadTableView()
                
                self.view?.hideIndicator()
                let data = value["data"] as! [[String:Any]]
                for i in data{
                    let MedisinData = MedisnModel().getObject(dicc: i)
                    self.treatmentsSearchArray.append(MedisinData)
                    self.treatmentsArray.append(MedisinData)
                }
                
                if(self.treatmentsArray.count == 0){
                    self.view?.ShowNoDataImage()
                }else{
                    self.view?.fetchingDataSuccess()
                }
            }
        }
    
    }
    func UpdatePrescription(id:String,medicines:[Int],deletedmedicines:[Int]){
        view?.showIndicator()
        TabBarinteractor.updatePrescription(id: id, medicines: medicines, deletedmedicines: deletedmedicines).send(DefaultResponse.self){
            [weak self] (response) in

            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                self.view?.showSuccessMssge(msg: value.msg ?? "")
              
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    func sendTreatment (user_id:Int,medicines:[Int],room_id:Int){
        view?.showIndicator()
        TabBarinteractor.makePrescription(room_id: room_id, user_id: user_id, medicines: medicines).send(DefaultResponse.self){
            [weak self] (response) in

            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
             //   self.view?.showSuccessMssge(msg: value.msg ?? "")
                self.view?.showSuccesssMsg(msg: value.msg ?? "" )
              
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    //MARK:- 2 view initionalizer
    
    init(view: SendTreatmentView) {
        self.view = view
    }
    
    func selectTreatment(index:Int){
         if( self.treatmentsArray[index].isSelected  == "true"){
            self.treatmentsArray[index].isSelected = "false"
        }else{
            self.treatmentsArray[index].isSelected = "true"
        }
        self.view?.ReloadTableView()
    }
    
    func SetSelectedTretmentArray(){
        self.view?.SetSelectedTreatmentID(treatmentsArray: self.treatmentsArray)
       
    }
    
    //MARK: - 3 class functions
    func configureTreatmentCells(cell: TreatmentCellView, for index: Int) {
        // incomplete set data to cell
        cell.setTreatmentName(name: treatmentsArray[index].name)
        cell.setCost(cost:treatmentsArray[index].price)
        cell.setButtonImage(isSelected: treatmentsArray[index].isSelected)
    }
    
    func getcellsCount () -> Int {
        return treatmentsArray.count
    }
}
