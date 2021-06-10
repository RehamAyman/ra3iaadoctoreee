//
//  Constants.swift
//  SeaTrips
//
//  Created by Sara Mady on 21/12/2020.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//

import Foundation
import UIKit
let defaults = UserDefaults.standard
let Lang_ar = "ar"
let Lang_en = "en"
let textFiledWidth = ((UIScreen.main.bounds.width)/1.2)
let iosMinumumLocalizationMirror  = "10"
let NotficationStatus  = "NotficationStatus"
let userType = ""


func getNotficationStatus() -> String{
    
    if  UserDefaults.standard.object(forKey: NotficationStatus) != nil{
        return  String(UserDefaults.standard.string(forKey: NotficationStatus)!)

    }else{
        return  "open"

    }
}

func getUserType() -> String{
    
    
        return  String(UserDefaults.standard.string(forKey: userType)!)

    
}
