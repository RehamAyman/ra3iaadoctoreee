//
//  File.swift
//  Ra3ia
//
//  Created by Sara Mady on 08/04/2021.
//

import Foundation

// MARK: - DoctorPrescriptionsModel
struct DoctorPrescriptionsModel: Codable ,CodableInit{
    let key: String
    let code: Int
    let data: [Prescription]
}

// MARK: - Datum
struct Prescription: Codable {
    let id: Int
    let totalPrice: String
    let totalQty: Int
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case totalPrice = "total_price"
        case totalQty = "total_qty"
        case createdAt = "created_at"
    }
}
