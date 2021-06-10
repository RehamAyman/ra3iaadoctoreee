//
//  NotificatonPresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/28/21.
//


import Foundation

//MARK:- protocols

protocol NotificatonView : class {
    
    func fetchingDataSuccess()
    func SetUpTableview()
    func showIndicator()
    func hideIndicator()
    func showError(error:String)
    func DidSelct(id:Int)
}

// cells

protocol NotificatonCellView {
    func setTitle ( title : String)
  
}

//MARK:- presenter class

class  NotificatonPresenter {
    
    //MARK:- 1 variabals
    
    private weak var view : NotificatonView?
    var NotificatonArray = [notficationData]()
    
    
    //MARK:- 2 view initionalizer
    init(view: NotificatonView) {
        self.view = view
    }
    
    func viewWillApper(){
        self.NotificatonArray.removeAll()
        self.view?.fetchingDataSuccess()
        self.getNotifactionsData()
    }
    
    
    
    //MARK: - 3 class functions
  
    func configureRecipesCells(cell: notificationCell, for index: Int) {
        cell.setTitle(title: self.NotificatonArray[index].content)
    }
    
    func getNotifactionsData(){
        view?.showIndicator()
        TabBarinteractor.notifications.send(NotficationResponse.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                self.NotificatonArray = value.data
                self.view?.fetchingDataSuccess()
                print("unAuthorized")
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
  
    
    func didSelectRow(index:Int){
        //self.view?.DidSelct(id: self.PrescriptionArray[index].id)
    }
    
    
    func getcellsCount () -> Int {
        return NotificatonArray.count
    }
    

  
    

}
