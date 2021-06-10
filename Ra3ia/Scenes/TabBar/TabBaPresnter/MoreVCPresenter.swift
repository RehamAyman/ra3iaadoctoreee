//
//  MoreVCPresenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/21/21.
//

import Foundation


//MARK:- protocols


protocol MoreView: class {
    func LogOutFromApp()
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func goToNotifications() 
    func goToMyProfileScreen()
    func goToLanguageScreen()
    func goToMyUsers()
    func goToRispies()
    func goToMyReviwe()
    func goToDoctorStatistics()
    func callUs()
    func goToAgremnt()
    func goToAbout()
    func goToComplmint()
    func LogOut()
    func showError(error: String)
    func showSuccess(msg: String)
 }

protocol MoreCellsView {
    func displayMainLabel(name: String)
    func displayDetails(name: String)
    func displayImage(image: String)
}

//MARK:- presenter class

class MoreVcPresenter {
    //MARK:- 1 variabals
    
    private weak var view : MoreView?
    // cells
   
    var imagesArray = ["user","language","clients", "wasf" , "rates" , "stat" , "phone","terms" ,"about" ,"shkwa" ,"logout"]
    
    var mainLabelsArray = ["Personal data".localized,"language".localized,"My clients".localized,"My recipes".localized ,"My review".localized, "statistics".localized,"call us".localized , "Usage Policy".localized , "About the app".localized , "Complaints and suggestions".localized,"Logout".localized ]
   
    var DetailsLabelsArray = ["personal information".localized,
                              "Language control".localized,
                              "See clients".localized,
                              "Review medication prescriptions".localized ,
                              "You can see your overall rating".localized ,
                              "You can view the statistics from here".localized ,
                              "Is there a problem ? We will help you solve it".localized,
                              "Any terms or conditions that are updated in the app".localized,
                              "Abstract".localized ,
                              "Send your complaint or suggestion here".localized  ,
                              ""
    ]
    
    //MARK:- 2 view initionalizer
    
    init(view: MoreView) {
        self.view = view
    }
    
    
    func openMyProfile(){
        self.view?.goToMyProfileScreen()
    }
    func openLanguageScreen(){
        self.view?.goToLanguageScreen()
    }
    func openMyUsersScreen(){
        self.view?.goToMyUsers()
    }
    func goToRispiesScreen(){
        self.view?.goToRispies()
    }
    func goToMyReviewScreen(){
        self.view?.goToMyReviwe()
    }
    
    func goToDoctorStatisticsScreen(){
        self.view?.goToDoctorStatistics()
    }
    func goToCullUsScreen(){
        self.view?.callUs()
    }
    func GoToAgreemntScreen(){
        self.view?.goToAgremnt()
    }
    func GoToAboutScreen(){
        self.view?.goToAbout()
    }
    func GoToComplimentScreen(){
        self.view?.goToComplmint()
    }
    func LogOut(){
        self.view?.LogOut()
    }
    func didSelectRow(index:Int){
        switch index {
        case 0:
            openMyProfile()
        case 1:
            openLanguageScreen()
        case 2:
            openMyUsersScreen()
        case 3:
            goToRispiesScreen()
        case 4:
            goToMyReviewScreen()
        case 5:
            goToDoctorStatisticsScreen()
        case 6 :
            goToCullUsScreen()
        case 7:
            GoToAgreemntScreen()
        case 8 :
            GoToAboutScreen()
        case 9:
            GoToComplimentScreen()
        case 10 :
            LogOut()
        default:
            break
        }
    }
    
   //MARK: - 3 class functions
    
    func getcellsCount() -> Int {
        return mainLabelsArray.count
    }
    
    
    func configure(cell: MoreCellsView, for index: Int) {
        cell.displayMainLabel(name: self.mainLabelsArray[index])
        cell.displayDetails(name: self.DetailsLabelsArray[index])
        cell.displayImage(image: self.imagesArray[index])
     }
 
    func LogOutApp(){
        view?.showIndicator()
        TabBarinteractor.logout(device_id: AppDelegate.FCMTOKEN).send(DefaultResponse.self){
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
                
                SocketConnection.sharedInstance.socket.disconnect()
                KeyChain.deleteToken()
                User.currentUser = nil
                self.view?.LogOutFromApp()
                
                
                
            case .errorResponse(let error):
                guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
                self.view?.showError(error: errorMessage.localizedDescription.localized)
            }
        }
    }
    
    
    
//     func LogOutApp(){
//    view?.showIndicator()
//    TabBarinteractor.logout(device_id: AppDelegate.FCMTOKEN).send(DefaultResponse.self){
//        [weak self] (response) in
//
//        guard let self = self else { return }
//        self.view?.hideIndicator()
//        switch response {
//        case .unAuthorized(_):
//            print("unAuthorized")
//        case .failure(let error):
//
//            print("failure\(String(describing: error))")
//        case .success(let value):
//            self.view?.showSuccess(msg: value.msg ?? "")
//            SocketConnection.sharedInstance.socket.disconnect()
//            KeyChain.deleteToken()
//            User.currentUser = nil
//            self.view?.LogOutFromApp()
//        case .errorResponse(let error):
//            guard let errorMessage = error as? APIError else { return  showNoInterNetAlert()}
//            self.view?.showError(error: errorMessage.localizedDescription.localized)
//        }
//    }
//}
}
