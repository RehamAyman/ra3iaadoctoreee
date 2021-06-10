//
//  ConversationVc+presenterDelegate.swift
//  Ra3ia
//
//  Created bySara Mady on 3/22/21.
//

import UIKit
import ViewAnimator
import SKActivityIndicatorView
extension HomeVC : HomeView {
   
    func setHomeData(data: DataClass) {
        self.UserImage.setImageWith(data.avatar)
        self.userName.text = "Hello".localized + " / " + data.name
        self.MessageRequests.text = "you have".localized + "  " +  String(data.newRooms.count) +  " message requestes".localized
       
        
        if(data.toggleNotifications == 1){
            switchOutlet.setOn(true, animated: true)
        }else{
            switchOutlet.setOn(false, animated: true)
        }
        
    }
    func showSuccess(msg: String) {
        showSuccessAlert(title: "", message: msg)
    }
    
    func fetchingDataSuccess() {
        self.tableview.reloadData()
        animateView()
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)

    }
      func showIndicator(){
        SKActivityIndicator.show()
    }
    
    func hideIndicator(){
        SKActivityIndicator.dismiss()
    }
    func Connected(bool: Bool) {
        if bool == true {
            
            // connected
            self.tableview.isHidden = false
            self.DissconnectedView.isHidden = true
            self.fetchingDataSuccess()
            presenter.toggleConnectionsRequest()
            timerCounting = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerCounter), userInfo: nil, repeats: true)
            
            
            
        } else {
            
            // dissconnected
            
            self.tableview.isHidden = true
            self.DissconnectedView.isHidden = false
            presenter.toggleConnectionsRequest()
            
            self.count = 0
            self.timer.invalidate()
            self.TIMER.text = self.makeTimeString(hours: 0, min: 0, sec: 0)

        }
    }
    
    
    func GotoTextChat(id: Int) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as? ChatViewController {
            vc.roomID = id
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    func goToNotifications() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "notificationsVC") as? notificationsVC {
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
   
    
    func animateView () {
        
        let ANIMATION = AnimationType.zoom(scale: 0.2)
        let fromAnimation = AnimationType.vector(CGVector(dx: 30, dy: 0))
       // let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/4)
        UIView.animate(views: tableview.visibleCells, animations: [fromAnimation, ANIMATION], duration: 0.8 )

    }
    
    func makeTimeString (hours: Int , min : Int , sec : Int ) -> String{
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        
        timeString += String(format: "%02d", min)
        timeString += " : "
        
        timeString += String(format: "%02d", sec)
       
        return timeString
        
        
    }
    func secondToMinToHours (seconds : Int) -> (Int, Int , Int) {
        
        // sec    min   hours
        return (seconds / 3600 , ((seconds % 3600) / 60) ,   ((seconds % 3600) % 60 )    )
    }
    
    
    
}
