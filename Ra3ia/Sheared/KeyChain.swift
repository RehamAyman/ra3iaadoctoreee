//
//  KeyChain.swift
//  TaxiAwamerCaptain
//
//  Created by Abdallah Nader on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import Foundation
import KeychainSwift

struct KeyChain {
    private static let tokenKey = "token"
    static var userToken: String? {
        get {
            let keychain = KeychainSwift()
            return keychain.get(tokenKey)
        } set {
            let keychain = KeychainSwift()
            if let value = newValue {
                keychain.set(value, forKey: tokenKey)
            } else {
                keychain.delete(tokenKey)
            }
        }
    }
    
    static var tokenExist: Bool {
        let keychain = KeychainSwift()
        return keychain.get(tokenKey) != nil
    }
    
    static func deleteToken() {
        let keychain = KeychainSwift()
        keychain.delete(tokenKey)
    }
}
