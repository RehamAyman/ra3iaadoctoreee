//
//  MoreVcPresenterDelegate.swift
//  Ra3ia
//
//  Created bySara Mady on 3/21/21.
//

import UIKit
import ViewAnimator
import SKActivityIndicatorView
extension MoreVC : MoreView {
    func LogOutFromApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard let window = UIApplication.shared.keyWindow else { return }
            let vc = Storyboard.Main.initialViewController()
            window.rootViewController = vc
        }
    }
    
    func showIndicator() {
        SKActivityIndicator.show()
    }
    
    func hideIndicator() {
        SKActivityIndicator.dismiss()
        
    }
    
    func LogOut() {
        let alert = UIAlertController(title: "Sign Out".localized, message: "Are you sure you want to log out?".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK".localized, style: .default, handler: { action in
            self.presenter.LogOutApp()
            
            
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel".localized, style: .cancel, handler: { action in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }
    
    func showSuccess(msg: String) {
        showSuccessAlert(title: "", message: msg)
    }
    
  
  
    func goToNotifications() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "notificationsVC") as? notificationsVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func fetchingDataSuccess() {
//        self.tableview.reloadData()
//        self.animateView()
        
    }
    
    func animateView () {
        SetUpTableView()
        self.tableview.isHidden = false
        self.tableview.reloadData()
        let fromAnimation = AnimationType.vector(CGVector(dx: 40, dy: 0))
        UIView.animate(views: tableview.visibleCells, animations: [fromAnimation], duration: 0.8 )
        tableview.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        tableview.backgroundColor = UIColor.clear
    }
    
    func goToMyProfileScreen() {
        let vc = Storyboard.Main.viewController(PersonalInfoVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func goToLanguageScreen() {
        let vc = Storyboard.Main.viewController(LanguageVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToMyUsers() {
        let vc = Storyboard.Main.viewController(MyClientsVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToRispies() {
        let vc = Storyboard.Main.viewController(MyRecipesVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func goToMyReviwe(){
        let vc = Storyboard.Main.viewController(MyReviewVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func goToDoctorStatistics() {
        let vc = Storyboard.Main.viewController(staticksVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func callUs() {
        let vc = Storyboard.Main.viewController(CallUsVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func goToAgremnt() {
        let vc = Storyboard.Main.viewController(UsagePolicyVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToAbout() {
        let vc = Storyboard.Main.viewController(AboutAppVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func goToComplmint() {
        let vc = Storyboard.Main.viewController(ComplaintsVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
