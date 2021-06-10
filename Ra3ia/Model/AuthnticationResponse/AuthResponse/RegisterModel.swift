//
//  RegisterModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 05/04/2021.
//

import Foundation

// MARK: - FillterdDoctors
struct RegisterModel: Codable ,CodableInit{
    let key: String
    let code: Int
    let msg: String
    let data: registerData
}

// MARK: - DataClass
struct registerData: Codable {
    let token, status: String
}
