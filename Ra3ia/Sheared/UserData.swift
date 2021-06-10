//
//  UserData.swift
//  TaxiAwamerCaptain
//
//  Created by Abdallah Nader on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import Foundation

class UserData {
    class func user()-> User?{
        if let decoded  = UserDefaults.standard.object(forKey: "user") as? User{
//            let decodedData = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! User
            return decoded
        }else{
            return nil
        }
    }

    class func isVisitor()-> String{
        if let decoded  = UserDefaults.standard.object(forKey: "isVisitor") as? String{
            return decoded
        }else{
            return "0"
        }
    }
    class func deleteUser(){
        UserDefaults.standard.removeObject(forKey: "user")
        UserDefaults.standard.set("0", forKey: "isVisitor")
    }
}

