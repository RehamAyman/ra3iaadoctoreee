//
//  ConversationVcPresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/22/21.
//

import Foundation
//MARK:- protocols
protocol ConvView : class {
    func FeatchData()
    func GotoTextChat(id:Int)
    func goToNotifications ()
    func showIndicator()
    func hideIndicator()
    func showError(error:String)

}


// note :  same home cells with the same cell protocol (ConvCellView)

//MARK:- presenter class

class ConversationVcPresenter {
    //MARK:- 1 variabals
    private weak var view : ConvView?
    
    // replace with api arrays
    var OpenningMessages = [Active_rooms]()
    var FinsedMessge = [finished_rooms]()
  
    //MARK:- 2 view initionalizer
    
    init(view: ConvView) {
        self.view = view
    }
    

    //MARK: - 3 class functions
    
    func viewWillApper(){
        OpenningMessages.removeAll()
        FinsedMessge.removeAll()
        self.view?.FeatchData()
        self.getMessagesRequest()
    }
    
    
    func getCountOfOpningMessages() -> Int{
        return self.OpenningMessages.count
       
    }
    func getCountOfFinshedMessages() -> Int{
        return self.FinsedMessge.count
       
    }
    
    func configureOpenningMessages(cell: ConversationReqCell, for index: Int) {
        cell.SetSenderName(name: self.OpenningMessages[index].sender_name)
        cell.SetSendingTime(time: self.OpenningMessages[index].last_message_created_at)
        cell.displayMessageContent(message: self.OpenningMessages[index].last_message_content)
        cell.displayImage(image: self.OpenningMessages[index].sender_avatar)
    }
    
    func configureFinshedgMessages(cell: ConversationReqCell, for index: Int) {
        cell.SetSenderName(name: self.FinsedMessge[index].sender_name)
        cell.SetSendingTime(time: self.FinsedMessge[index].last_message_created_at)
        cell.displayMessageContent(message: self.FinsedMessge[index].last_message_content)
        cell.displayImage(image: self.FinsedMessge[index].sender_avatar)
    }
    func getMessagesRequest(){
        
        
        view?.showIndicator()
        TabBarinteractor.doctorRooms.send(RooomsModel.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                
                print("failure\(String(describing: error))")
            case .success(let value):
                self.OpenningMessages = value.data.active_rooms
                self.FinsedMessge = value.data.finished_rooms

                 self.view?.FeatchData()
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    func didSelectRow(index:Int  ){
      
        self.view?.GotoTextChat(id: OpenningMessages[index].id)
        
       
        print("============")
        print(OpenningMessages)
    }
    
}
