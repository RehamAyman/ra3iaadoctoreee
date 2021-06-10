//
//  AppAlert.swift
//  SeaTrips
//
//  Created by Sara Mady on 11/4/20.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//

import Foundation
import UIKit
import SPAlert

    func showSuccessAlert(title:String,message:String){
        SPAlert.present(title: message, preset: .done)
    }
    
    func showErrorAlert(title:String,message:String){
        SPAlert.present(title: message, preset: .error)

    }

func completData(title:String,message:String){
    SPAlert.present(message:message, haptic: .error)

}
func showWarningAlert(title:String,message:String){
    SPAlert.present(title: message, preset: .custom(UIImage(named: "cirrcle")!))
    
    
}



func showNoInterNetAlert(){
//    let statusAlert = StatusAlert()
//
//    statusAlert.image = #imageLiteral(resourceName: "cloud")
//    statusAlert.title = ""
//    statusAlert.message =  "Make sure you are connected to the Internet!" .localized
//    statusAlert.canBePickedOrDismissed = true
//
//    // Presenting created instance
//    statusAlert.showInKeyWindow()
}
