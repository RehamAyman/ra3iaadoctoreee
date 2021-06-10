//
//  AuthResponse.swift
//  SeaTrips
//
//  Created by Sara Mady on 11/5/20.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//
import Foundation

import Foundation


struct resendCodeModel : Codable, CodableInit {
    var key: String
    var code: Int
    var status :String?
    
  
}



struct AuthResponse: Codable ,CodableInit{
    let key: String
    let code: Int?
    let data: User
    
}

// MARK: - DataClass
struct User: Codable {
    let status: String
    let id: Int
    let token:String?
    let avatar: String
    let  fname, lname, email: String
    let phone: String
    let subscribed:String?
    var  lat, lng : String
    let address: String
    var accType:String
    enum CodingKeys: String, CodingKey {
        case token, status, id, avatar
        case accType = "acc_type"
        case fname, lname, email, phone, subscribed, lat, lng, address
    }
}




extension User {
    static var currentUser: User? {
        
        get {
            let userDefaults = UserDefaults.standard
            let decoder = JSONDecoder()
            guard let savedPerson = userDefaults.object(forKey: UserDefaultsKeys.user.rawValue) as? Data, let loadedPerson = try? decoder.decode(User.self, from: savedPerson) else { return nil }
            return loadedPerson
        }set {
            let userDefaults = UserDefaults.standard
            guard let value = newValue else {
                userDefaults.set(nil, forKey: UserDefaultsKeys.user.rawValue)
                return
            }
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(value) {
                userDefaults.set(encoded, forKey: UserDefaultsKeys.user.rawValue)
            }
        }
    }
}

enum UserDefaultsKeys: String {
    case user
}
