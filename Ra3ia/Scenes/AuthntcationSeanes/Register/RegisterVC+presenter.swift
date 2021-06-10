//
//  RegisterVC+presenter.swift
//  Ra3ia
//
//  Created bySara Mady on 3/24/21.
//

import UIKit
import ReCaptcha
import SKActivityIndicatorView

extension RegisterVC : RegisterView  , selectDate  , UICollectionViewDelegateFlowLayout {
    func showSuccess(msg: String) {
        Ra3ia.showSuccessAlert(title: "", message: msg)
    }
    
    
    func showWarningAlert(msg: String) {
        Ra3ia.showWarningAlert(title: "", message: msg)
    }
    
    
    
    
    func featchData(data: Anmils) {
        print("=============== data animals ")
        print(data)
    }
    

   
    func fetchingDataSuccess() {
        self.TypeCollectionView.reloadData()
        self.specCollectionView.reloadData()
        let height : CGFloat = TypeCollectionView.collectionViewLayout.collectionViewContentSize.height
        typeHeight.constant = height
        let Specheight : CGFloat = specCollectionView.collectionViewLayout.collectionViewContentSize.height
        specHeight.constant = Specheight
        

        
        self.view.setNeedsLayout()
        
        //self.view.layoutIfNeeded()
    }
    
    func setupCollections() {
        TypeCollectionView.delegate = self
        TypeCollectionView.dataSource = self
        specCollectionView.delegate = self
        specCollectionView.dataSource = self
        TypeCollectionView.register(UINib(nibName: "TypeCell", bundle: nil), forCellWithReuseIdentifier: "TypeCell")
        specCollectionView.register(UINib(nibName: "specCell", bundle: nil), forCellWithReuseIdentifier: "specCell")
        
     
        
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
    
    func showMsg(msg: String) {
        completData(title: "", message: msg)
    }
    
   
//    func setupReCaptcha() {
//        self.recaptcha?.configureWebView { [weak self] webview in
//               webview.frame = self?.view.bounds ?? CGRect.zero
//           }
//    }
    
    func GoToVreficatinPage() {
        let vc  = Storyboard.Main.viewController(ActivationCodeVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func PresentSelectDate() {
        if let vc = storyboard?.instantiateViewController(identifier: "SelectBirthDateVC") as? SelectBirthDateVC {
            
            vc.delgate = self
            
            present(vc, animated: true, completion: nil)
            
        }}
    
  
    
    
    func GoToHomePage() {
        if let vc = storyboard?.instantiateViewController(identifier: "") as? HomeVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    func selectedDate(date: String) {
           self.BirthDateTextField.text = "\(date)"
          
       }
    
 
       
    
    
    }
//
//extension RegisterVC  {
//
//
//    func recaptchavalidate() {
//        recaptcha?.validate(on: view) { [weak self] (result: ReCaptchaResult) in
//
//           print(try? result.dematerialize())
//
//        }
//
//
//    }
//
//}

