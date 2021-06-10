//
//  MedisinModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 11/04/2021.
//

import Foundation

// MARK: - MedisinModel
struct MedisinModel: Codable ,CodableInit{
    let key: String
    let code: Int
    let data: [Medisin]
}

// MARK: - Datum
struct Medisin: Codable {
    let id: Int
    let name: String
    let image: String
    let price: String
}
