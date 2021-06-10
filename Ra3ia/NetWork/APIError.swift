//
//  APIError.swift
//  TaxiAwamerCaptain
//
//  Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import Foundation

enum APIError:  LocalizedError {
//    case unauthorized = "419"
    case unkownError(message:String)
    var localizedDescription: String {
        switch self {
            
//        case .unauthorized:
//            return "Unauthorized"
        case .unkownError(let message):
            return message
        }
    }
}
