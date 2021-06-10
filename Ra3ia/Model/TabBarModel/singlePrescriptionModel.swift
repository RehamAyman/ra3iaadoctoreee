//
//  singlePrescriptionModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 08/04/2021.
//

import Foundation
struct singlePrescriptionModel: Codable,CodableInit {
    let key: String
    let code: Int
    let data: singlePrescriptionData
}

// MARK: - DataClass
struct singlePrescriptionData: Codable {
    let id: Int
    let totalPrice: String
    let totalQty: Int
    let createdAt: String
    let medicines: [Medicine]

    enum CodingKeys: String, CodingKey {
        case id
        case totalPrice = "total_price"
        case totalQty = "total_qty"
        case createdAt = "created_at"
        case medicines
    }
}

// MARK: - Medicine
struct Medicine: Codable {
    let id: Int
    let price, name: String
    let image: String
}
