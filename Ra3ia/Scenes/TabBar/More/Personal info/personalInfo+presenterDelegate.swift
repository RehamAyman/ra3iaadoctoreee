//
//  personalInfo+presenterDelegate.swift
//  Ra3ia
//
//  Created bySara Mady on 3/30/21.
//

import UIKit
import SKActivityIndicatorView
extension PersonalInfoVC : PersonalInfoView {
 
    
    
    func showSuccess(msg: String) {
    showSuccessAlert(title: "", message: msg)
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
    
    func setPersonalData(personalData: personalInfoData) {
        self.userImage.setImageWith(personalData.avatar)
        self.userNAme.text = personalData.name
        self.phonNumber.text = personalData.phone
        self.cv.text = personalData.bio
        self.email.text = personalData.email
        
        
        
        
    
//
//        self.ExperianseArray.append(personalData.experiences)
//
//
//
//
    }
    
    
    
    
    func fetchingDataSuccess() {
        self.typeCollectionView.reloadData()
        self.specCollectionView.reloadData()
        self.addTableview.reloadData()
        let height : CGFloat = typeCollectionView.collectionViewLayout.collectionViewContentSize.height
        typeHeight.constant = height
        let Specheight : CGFloat = specCollectionView.collectionViewLayout.collectionViewContentSize.height
        specHeight.constant = Specheight
        

        
        self.view.setNeedsLayout()
        
    }
    
    func setupCollections() {
     
        
        
        typeCollectionView.dataSource = self
        typeCollectionView.delegate = self
        specCollectionView.dataSource = self
        specCollectionView.delegate = self
        typeCollectionView.register(UINib(nibName: "TypeCell", bundle: nil), forCellWithReuseIdentifier: "TypeCell")
        specCollectionView.register(UINib(nibName: "specCell", bundle: nil), forCellWithReuseIdentifier: "specCell")
        
    }
    
    func setUpTabel() {
        addTableview.delegate = self
        addTableview.dataSource = self
   //     addTableview.isHidden = true
    }
    
    
    
    
    
}
