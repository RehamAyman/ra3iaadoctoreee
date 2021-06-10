//
//  anmilsModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 04/04/2021.
//

import Foundation

// MARK: - FillterdDoctors
struct Anmils: Codable ,CodableInit{
    let key: String
    let code: Int
    let data: [anmil]
}

// MARK: - Datum
struct anmil: Codable {
    let id: Int
    let name: String
}
