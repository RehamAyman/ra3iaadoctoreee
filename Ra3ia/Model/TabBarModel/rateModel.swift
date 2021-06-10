//
//  rateModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 12/04/2021.
//

import Foundation

// MARK: - MedisinModel
struct rateModel: Codable ,CodableInit{
    let key: String
    let code: Int
    let data: rateData
}

// MARK: - DataClass
struct rateData: Codable {
    let rate: String
}
