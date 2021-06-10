//
//  AboutAppModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 13/04/2021.
//

import Foundation

// MARK: - AgreamentsModel
struct AboutAppModel: Codable ,CodableInit{
    let key: String
    let code: Int
    let data: AboutData
}

// MARK: - DataClass
struct AboutData: Codable {
    let about: String
}
