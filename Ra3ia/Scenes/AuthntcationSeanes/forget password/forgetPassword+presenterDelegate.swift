

//
import Foundation
import SKActivityIndicatorView


extension ForgetPasswordVC : ForgetPasswordView {
    
    
    func GoToResetPasswordScreen() {
        let vc =  Storyboard.Main.viewController(resetPasswordVc.self)
        vc.mobileNum = mobilNumber.text ?? ""
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showIndicator() {
        SKActivityIndicator.show()
    }

    func hideIndicator() {
        SKActivityIndicator.dismiss()
    }

    func showError(error: String) {
        showErrorAlert(title: "", message: error)
    }

    func showSuccess(msg: String) {
        showSuccessAlert(title: "", message: msg)
    }

 
    func gotoaverificationScreen() {
//        let vc = Storyboard.Authntication.viewController(verificationVc.self)
//               self.navigationController?.pushViewController(vc, animated: true)
    }


}
