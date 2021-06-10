//
//  ChatVC+Prisnter.swift
//  SeaTrips
//
//  Created by Sara Mady on 03/12/2020.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//

import Foundation
import AVKit
import SKActivityIndicatorView
import PopMenu


extension ChatViewController:ChatView


{
 
    func gotoClientRatePage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ){
            
            
        let vc = Storyboard.Main.viewController(AddClientRateVC.self)
        vc.reciverId = self.reciverId
        
        
        self.navigationController?.pushViewController(vc, animated: true)
            
            
        }
    }
    
    
    func showMoreAlert() {
        
        
        let manager = PopMenuManager.default
      
        // add image
        
        let action1 = PopMenuDefaultAction(title: "Add image".localized, image: UIImage(named: "eye")) { (acion) in
           // manager.popMenuShouldDismissOnSelection = true
            
            self.dismiss(animated: true, completion: nil)
            self.AddImageAlert()
            
            }
     
        
        // send tratment
        let action2 = PopMenuDefaultAction(title: "Send a treatment".localized , image: UIImage(named: "attach")) { (action) in
             
            
            self.dismissKeyboard()
            self.optionView.isHidden = true
            let vc = Storyboard.Main.viewController(SendTreatmentVC.self)
            
            vc.userId = self.reciverId
            vc.roomId = self.roomID
            vc.isComeFromChat = true
            vc.isComeFromMore = false
           
            self.navigationController?.pushViewController(vc, animated: true)
            
            
            }
        
      
        let action3 =  PopMenuDefaultAction(title: "Finish chat".localized , image: UIImage(named: "chatt")) { (action) in
            
            
            SocketConnection.sharedInstance.socket.off("newMessage")
            SocketConnection.sharedInstance.socket.emit("exitChat", with: []) {
                print("added user id \(String(User.currentUser?.id ?? 0))")
            }
            
            
            self.Prisnter.finishRoom(id: self.roomID)
            
            
        }
      
       
            manager.addAction(action1)
            manager.addAction(action2)
            manager.addAction(action3)
           
    
      
       
        
        
        
        
        
        
        manager.popMenuAppearance.popMenuColor.actionColor = .tint(UIColor(named: "BaseColour")!)
        manager.popMenuAppearance.popMenuFont = UIFont(name: "Fairuz-Bold", size: 15)!
        manager.popMenuAppearance.popMenuColor.backgroundColor = .solid(fill: .white)
        manager.popMenuAppearance.popMenuItemSeparator = .fill(UIColor(named: "BaseColour")!, height: 1)
       
        manager.present(sourceView: self.moreOutlet, on: self, animated: true, completion: nil)
       
        
        
        
        
    }
    
    
    
//    func finishPassing(location: String, lat: Double, lng: Double, isRecive: String) {
//        let l = LocationMapModel(lat: lat, addresse: location, lang: lng)
//        let activitesData = try? JSONSerialization.data(withJSONObject: l.toDic(), options: [])
//        let activitiesDataJson = String(data: activitesData!, encoding: String.Encoding.utf8)
//        Prisnter.sendMessages(message: activitiesDataJson!, type: "map")
//    }
    
    
   

    
//    func goToContractPage(contarctID: Int, data: ChatData) {
//        let vc = Storyboard.Main.viewController(AgrementViewController.self)
//        vc.contractID = contarctID
//        vc.UserChatData = data
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
    
    

    func showSuccessMessage(msg:String){
        showSuccessAlert(title: "", message: msg)
    }
    func EmptyMessageText() {
        self.textFeild.text = ""
    }
    func goToNextPage(resirvId: Int) {
        
    }
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    func showIndicator() {
        SKActivityIndicator.show()
    }
    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }
    func FeatchData() {
        self.tableView.reloadData()
    }
    
    func GetLastMassge(MessagesArray : [Message]) {
        if MessagesArray.count != 0 {
            let i = IndexPath(row: 0, section: MessagesArray.count-1)
            self.tableView.scrollToRow(at: i , at: UITableView.ScrollPosition.middle, animated: true)
        }
    }
    func setChatData(data: ChatData) {
        self.reciverId = data.receiverID
       
       // self.userName.text = data.receiverName
     //   self.userImage.setImageWith(data.receiverAvatar)
        //self.userPrice.text =  data.delivery_price + " " + "SR".localized
       // self.secondUserRate.rating = Double(data.re) ?? 0.0
      //  self.orderStatus.text = data.status
      //  self.orderStatus.clipsToBounds = true
       // self.orderID.text = "#  " +  String(data.id)
        //self.phonNumber = data.re
    //    UserChatData = data
//        if(data.order  == "intercity_delivery"){
//            self.orderDataStack.isHidden = false
//        }else{
//            self.orderDataStack.isHidden = true
//        }
        
//        if(data.order_type == "" || data.order_type == "advertisement"){
//            self.userPrice.text = String( data.contractPrice ?? "0.0") + " " + "SR".localized


    }
    
    func recordWithPermission(_ setup: Bool) {
        print("\(#function)")
        
        AVAudioSession.sharedInstance().requestRecordPermission {
            [unowned self] granted in
            if granted {
                
                DispatchQueue.main.async {
                    print("Permission to record granted")
                    self.setSessionPlayAndRecord()
                    if setup {
                        self.setupRecorder()
                    }
                    
                    self.recorder.record()
                    
                }
            } else {
                print("Permission to record not granted")
            }
        }
        
        if AVAudioSession.sharedInstance().recordPermission == .denied {
            print("permission denied")
        }
    }
    
    func setupRecorder() {
        let format = DateFormatter()
        format.dateFormat="yyyy-MM-dd-HH-mm-ss"
        let currentFileName = "recording-\(format.string(from: Date())).m4a"
        print("🖍\(currentFileName)")
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        self.soundFileURL = documentsDirectory.appendingPathComponent(currentFileName)
        print("writing to soundfile url: '\(soundFileURL!)'")
        if FileManager.default.fileExists(atPath: soundFileURL.absoluteString) {
            // probably won't happen. want to do something about it?
            print("soundfile \(soundFileURL.absoluteString) exists")
        }
        
        let recordSettings: [String: Any] =
            [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 12000,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            recorder = try AVAudioRecorder(url: soundFileURL, settings: recordSettings)
            recorder.delegate = self as! AVAudioRecorderDelegate
            recorder.isMeteringEnabled = true
            recorder.prepareToRecord() // creates/overwrites the file at soundFileURL
        } catch {
            recorder = nil
            print(error.localizedDescription)
        }
        
    }
    
    func setSessionPlayAndRecord() {
        print("\(#function)")
        
        let session = AVAudioSession.sharedInstance()
        do {
            //try session.setCategory(AVAudioSession.Category.playAndRecord)
            //    try session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
            try session.setCategory(AVAudioSession.Category.playAndRecord, options: .defaultToSpeaker)
            
        } catch {
            print("could not set session category")
            print(error.localizedDescription)
        }
        
        do {
            try session.setActive(true)
        } catch {
            print("could not make session active")
            print(error.localizedDescription)
        }
    }
    
    
    
}
