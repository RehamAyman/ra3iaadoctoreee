//
//  ConversationVCPresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/22/21.
//

import Foundation


//MARK: - required Protocols ( cells + view )

protocol HomeView : class {
    func Connected ( bool : Bool)
    func GotoTextChat(id:Int)
    func goToNotifications()
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error:String)
    func showSuccess(msg:String)
    func setHomeData(data:DataClass)

}
protocol ConvCellView {
    func displayImage (image : String)
    func displayMessageContent ( message : String)
    func setRates ( Rate : Int)
    func SetSenderName ( name : String)
    func SetSendingTime ( time : String)
    
}




//MARK: - presenter class
class HomeVcPresenter {
    
    
    //MARK:- 1 variabals
    
    private weak var view : HomeView?
    var MessagesRequset = [NewRoom]()
  
    
    
    //MARK:- 2 view initionalizer
    
    init(view: HomeView) {
        self.view = view
    }
    
   

    //MARK: - 3 class functions
     
    func viewDidLoad(){
        self.MessagesRequset.removeAll()
       
        
        
        if(SocketConnection.sharedInstance.socket.status == .notConnected){
            SocketConnection.sharedInstance.manager.connect()
            SocketConnection.sharedInstance.socket.connect()
        }
        if(SocketConnection.sharedInstance.socket.status == .disconnected){
            SocketConnection.sharedInstance.manager.connect()
            SocketConnection.sharedInstance.socket.connect()
        }
        
        
        self.view?.fetchingDataSuccess()
        self.getMessagesRequest()
        
        
    }
    
    
     func getcellsCount() -> Int {
        return MessagesRequset.count
     }
     
     func configure(cell: ConversationReqCell, for index: Int) {
        cell.displayImage(image: self.MessagesRequset[index].senderAvatar)
        cell.displayMessageContent(message: self.MessagesRequset[index].lastMessageContent)
        cell.SetSendingTime(time: self.MessagesRequset[index].lastMessageCreatedAt)
        cell.SetSenderName(name: self.MessagesRequset[index].senderName)
     }
    
    func getMessagesRequest(){
        view?.showIndicator()
        TabBarinteractor.doctorHome.send(HomeModel.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                
                print("failure\(String(describing: error))")
            case .success(let value):
                self.MessagesRequset = value.data.newRooms
                self.view?.setHomeData(data: value.data)
                self.view?.fetchingDataSuccess()
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    func toggleConnectionsRequest(){
        view?.showIndicator()
        TabBarinteractor.toggleConnection.send(DefaultResponse.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                
                print("failure\(String(describing: error))")
            case .success(let value):
                self.view?.showSuccess(msg: value.msg ?? "")
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    
    func dissconnectedUser () {
        
    }
    
    
    func gotoTextChat ( index : Int ) {
        
        self.view?.GotoTextChat(id: MessagesRequset[index].id)
    }
    
}

