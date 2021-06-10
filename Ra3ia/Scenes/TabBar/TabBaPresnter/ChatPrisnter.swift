//
//  ChatPrisnter.swift
//  SeaTrips
//
//  Created by Sara Mady on 03/12/2020.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

protocol  ChatView: class {
    func goToNextPage(resirvId:Int)
    func showError(error:String)
    func showIndicator()
    func hideIndicator()
    func FeatchData()
    func GetLastMassge(MessagesArray : [Message])
    func EmptyMessageText()
    func setChatData(data:ChatData)
    func showSuccessMessage(msg:String)
 
    func showMoreAlert ()
    func gotoClientRatePage ()
    
}

protocol  ChatCellView: class {
    func setImage(image:String,bool:Int)
    func setContent(msg:String)
}
protocol SoundCellView: class {
    func setImage(image:String,bool:Int)
    func setContent(msg:String)
}

protocol MapCellView: class {
    func setImage(image:String,bool:Int)
    func setContent(addressObject:[String:Any])
}
protocol ImageChatCellView: class {
    func setUserChatImage(image:String,bool:Int)
    func setChatImage(msg:String)
}

class ChatPrisnter {
    
    private weak var view: ChatView?
    var MessagesArray = [Message]()
    var roomId = ""
    var receiverId = ""
    var contarctID = 0
    var contractPrice = ""
    var UserChatData : ChatData!
    init(view:ChatView) {
        self.view = view
    }
    
    
    func viewDidLoad(roomId:Int){
        self.showChatData(roomId: roomId)
    }
   
    func CellConfigeration(cell:ChatCellTableViewCell,for Index:Int){
        
        cell.setImage(image: self.MessagesArray[Index].avatar,bool: self.MessagesArray[Index].sentByMe)
        cell.setContent(msg: self.MessagesArray[Index].content)
    }
    
        func ImageCellConfigeration(cell:ImageTableViewCell,for Index:Int){
            cell.setImage(image: self.MessagesArray[Index].avatar,bool: self.MessagesArray[Index].sentByMe)
            cell.setChatImage(msg: self.MessagesArray[Index].content)
        }
    func MapCellConfigeration(cell:ImageTableViewCell,for Index:Int){
        cell.setImage(image: self.MessagesArray[Index].avatar,bool: self.MessagesArray[Index].sentByMe)
        cell.setContent(addressObject:self.MessagesArray[Index].content.toJSON() as! [String : Any])
    }
    
    func SoundCellConfigeration(cell:SoundTableViewCell,for Index:Int){
        cell.setImage(image: self.MessagesArray[Index].avatar,bool: self.MessagesArray[Index].sentByMe)
        cell.setContent(msg: self.MessagesArray[Index].content)
    }
    
    
    func getMessagesnCount() -> Int{
        return self.MessagesArray.count
    }
    
    func ConnectToSocket(roomId:String) {
        print("🌻\(roomId)")
        if SocketConnection.sharedInstance.socket.status == .connected{
            let dic = [
                "room_id":"\(roomId)",
                "user_id":"\(String(User.currentUser?.id ?? 0))",
                
            ] as [String : Any]
            SocketConnection.sharedInstance.socket.emit("adduser", with: [dic]) {
                self.SockeConFigration()
                
            }
        }
        SocketConnection.sharedInstance.socket.on(clientEvent: .connect) { (data, ack) in
            print("🍋Connect")
            print("🍉\(data)")
            self.SockeConFigration()
            
        }
        SocketConnection.sharedInstance.socket.on(clientEvent: .error) { (data, ack) in
            print("🍋Error")
            print("🍉\(data)")
        }
        
        SocketConnection.sharedInstance.socket.on(clientEvent: .disconnect) { (data, ack) in
            print("🍋disconnect")
            print("🍉\(data)")
        }
        SocketConnection.sharedInstance.socket.on(clientEvent: .ping) { (data, ack) in
            print("🍋Ping")
            print("🍉\(data)")
        }
        
        SocketConnection.sharedInstance.socket.on(clientEvent: .reconnect) { (data, ack) in
            print("🍋reconnect")
            print("🍉\(data)")
        }
    }
    
    
    func SockeConFigration(){
        SocketConnection.sharedInstance.socket.on("newMessage") { (data, ack) in
            print("🌻\(data)")
            let dict = data[0] as! [String: Any]
            print("💙\(dict["message"] as? String ?? "")")
            
            self.MessagesArray.append(Message(id: 0, content: dict["content"] as? String ?? "", avatar: User.currentUser?.avatar ?? "", type: dict["type"] as? String ?? "" ,createdAt: "", sentByMe: 0))
            
            self.view?.FeatchData()
            self.view?.GetLastMassge(MessagesArray: self.MessagesArray)
        }
        
    }
    
    func sendMessages(message:String,type:String){
        if(message != ""){
           
            self.MessagesArray.append(Message(id: 0, content: message, avatar: User.currentUser?.avatar ?? "", type: type ,createdAt: "", sentByMe: 1))
            
            let test = ["sender_id": String(User.currentUser?.id ?? 0), "receiver_id": self.receiverId,"room_id":self.roomId,"content":message,"type": type] as [String : Any]
            
            SocketConnection.sharedInstance.socket.emit("sendMessage", test)
            self.view?.FeatchData()
            
            self.view?.GetLastMassge(MessagesArray: self.MessagesArray)
            
            
            self.view?.EmptyMessageText()
        }
    }

  
//    func payWithWallet(id:Int){
//        view?.showIndicator()
//        TabBarInteractor.paybywallet(id: id).send(DefaultResponse.self){
//            [weak self] (response) in
//
//            guard let self = self else { return }
//            self.view?.hideIndicator()
//            switch response {
//            case .unAuthorized(_):
//
//                print("unAuthorized")
//
//            case .failure(let error):
//
//                showNoInterNetAlert()
//                print("failure\(String(describing: error))")
//
//            case .success(let value):
//                self.view?.showSuccessMessage(msg:value.msg ?? "")
//            case .errorResponse(let error):
//                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
//                self.view?.showError(error: errorMessage.localizedDescription.localized)
//            }
//        }
//
//    }
    func finishRoom (id:Int ){
        view?.showIndicator()
        TabBarinteractor.finishRoom(id: id).send(DefaultResponse.self){
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
                self.view?.showSuccessMessage(msg: value.msg ?? "" )
                
              //  self.view?.baCkHome()
                self.view?.gotoClientRatePage()
              
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    func uploadNewImage(uploadData:[UploadData]){
        view?.showIndicator()
        TabBarinteractor.uploadFile.send(uploadFileModel.self, data: uploadData,  completion: {
            [weak self] (response) in

            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                print("unAuthorized")
            case .failure(let error):
                print("failure\(String(describing: error))")
            case .success(let value):
                self.sendMessages(message: value.data.name, type: "image")
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        })
    }
    func getCurrentTypeCell(index:Int)-> String{
        return self.MessagesArray[index].type
    }
    
    
//    func CancelOrder(id:Int){
//        view?.showIndicator()
//        TabBarInteractor.userCancelOrder(id: id).send(DefaultResponse.self){
//            [weak self] (response) in
//
//            guard let self = self else { return }
//            self.view?.hideIndicator()
//            switch response {
//            case .unAuthorized(_):
//
//                print("unAuthorized")
//
//            case .failure(let error):
//
//                showNoInterNetAlert()
//                print("failure\(String(describing: error))")
//
//            case .success(let value):
//                self.view?.showSuccessMessage(msg:value.msg ?? "")
//            case .errorResponse(let error):
//                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
//                self.view?.showError(error: errorMessage.localizedDescription.localized)
//            }
//        }
//
//    }
    func showChatData(roomId:Int){
        self.MessagesArray.removeAll()
        self.view?.FeatchData()
        view?.showIndicator()
        TabBarinteractor.doctorSingleRoom(id:roomId).send(ChatModel.self){
            [weak self] (response) in
            
            guard let self = self else { return }
            self.view?.hideIndicator()
            switch response {
            case .unAuthorized(_):
                
                print("unAuthorized")
                
            case .failure(let error):
                
                showNoInterNetAlert()
                print("failure\(String(describing: error))")
                
            case .success(let value):
                self.MessagesArray = value.data.messages
                self.view?.setChatData(data: value.data)
                self.roomId = String(value.data.id)
                self.receiverId = String(value.data.receiverID)
                self.view?.FeatchData()
                self.view?.GetLastMassge(MessagesArray: self.MessagesArray)
                //self.contarctID = value.data.contract_id ?? 0
                //self.contractPrice = value.data.delivery_price ?? "0"
                self.UserChatData = value.data
                self.ConnectToSocket(roomId:String(value.data.id))
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
        
    }
    
    func goToContractPage(){
      //  self.view?.goToContractPage(contarctID: self.contarctID, data: self.UserChatData)
    }
    
}
    
    
    
extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}

