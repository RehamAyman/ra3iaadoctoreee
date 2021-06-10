//
//  ConversationVc+presenterDelegate.swift
//  Ra3ia
//
//  Created bySara Mady on 3/22/21.
//

import UIKit
import ViewAnimator
import SKActivityIndicatorView
extension ConversationsVC : ConvView {
    
    func FeatchData() {
        self.tableview.reloadData()
        self.animateView()
        
    }
    func showIndicator(){
        SKActivityIndicator.show()
    }
    func hideIndicator(){
        SKActivityIndicator.dismiss()
    }
    func showError(error:String){
        showErrorAlert(title: "", message: error)
    }
    
    func GotoTextChat(id: Int) {
        
       let vc = Storyboard.Main.viewController(ChatViewController.self)
        vc.roomID = id
        self.navigationController?.pushViewController(vc, animated: true)
          
               
    }
 
   
    
    
    func goToNotifications() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "notificationsVC") as? notificationsVC {
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    func animateView () {
        
        let ANIMATION = AnimationType.zoom(scale: 0.2)
        let fromAnimation = AnimationType.vector(CGVector(dx: 30, dy: 0))
//        let rotateAnimation = AnimationType.rotate(angle: CGFloat.pi/4)
        UIView.animate(views: tableview.visibleCells, animations: [fromAnimation, ANIMATION], duration: 0.8 )

    }
    
    
    
}
