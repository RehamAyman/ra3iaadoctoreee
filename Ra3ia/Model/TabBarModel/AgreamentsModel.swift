//
//  AgreamentsModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 13/04/2021.
//

import Foundation
// MARK: - AgreamentsModel
struct AgreamentsModel: Codable,CodableInit {
    let key: String
    let code: Int
    let data: agreamentsData
}

// MARK: - DataClass
struct agreamentsData: Codable {
    let agreaments: String
}
