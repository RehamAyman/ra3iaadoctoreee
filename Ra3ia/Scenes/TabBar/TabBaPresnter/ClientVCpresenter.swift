//
//  ClientVCpresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/23/21.
//

import Foundation
//MARK:- protocols

protocol MYclientsView: class {
    func fetchingDataSuccess()
    func SetUpTableview()
    func showIndicator()
    func hideIndicator()
    func showError(error:String)

}

// cells

protocol ClientCellsView {
    func displayClientImage (image : String)
    func setRates ( Rate : String)
    func SetClientName ( name : String)
  
}

//MARK:- presenter class

class clientVcpresenter {
    
    //MARK:- 1 variabals
    
    private weak var view : MYclientsView?
      var CurrntClintsData = [Client]()
      var FinshedClintsData = [Client]()

    
    
    //MARK:- 2 view initionalizer
    
    init(view: MYclientsView) {
        self.view = view
    }
    
    func viwDidLoad(){
        self.CurrntClintsData.removeAll()
        self.FinshedClintsData.removeAll()
        self.view?.fetchingDataSuccess()
        self.getClintsData()
    }
    
    //MARK: - 3 class functions
   
    func getClintsData(){
        view?.showIndicator()
        TabBarinteractor.doctorClits.send(ClientsModel.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                
                print("failure\(String(describing: error))")
            case .success(let value):
                self.CurrntClintsData = value.data.activeClients
                self.FinshedClintsData = value.data.finishedClients

                self.view?.fetchingDataSuccess()
                print("unAuthorized")
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }

    
    func configureCurrentCells(cell: ClientCell, for index: Int) {
        cell.SetClientName(name: self.CurrntClintsData[index].senderName)
        cell.setRates(Rate: self.CurrntClintsData[index].rate)
        cell.displayClientImage(image: self.CurrntClintsData[index].senderAvatar)
    }
    
    func ConfigureFinshedCells ( cell : ClientCell , for index : Int) {
        cell.SetClientName(name: self.FinshedClintsData[index].senderName)
        cell.setRates(Rate: self.FinshedClintsData[index].rate)
        cell.displayClientImage(image: self.FinshedClintsData[index].senderAvatar)
        
    }
    
    
    
    
    func getNewClientsCount () -> Int {
        return CurrntClintsData.count
    }


    func getFinshedClientsCount () -> Int {
        return FinshedClintsData.count
    }


}
