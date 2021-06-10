//
//  NotficationResponse.swift
//  Ra3ia
//
//  Created by Sara Mady on 24/05/2021.
//

import Foundation

// MARK: - SelectedGroupModel
struct NotficationResponse: Codable,CodableInit {
    let key: String
    let code: Int
    let data: [notficationData]
}

// MARK: - Datum
struct notficationData: Codable {
    let id: Int
    let title, content: String
    let auctionID, productID, orderID, roomID: Int
    let prescriptionID, advertisementID, contractID: Int
    let type: String

    enum CodingKeys: String, CodingKey {
        case id, title, content
        case auctionID = "auction_id"
        case productID = "product_id"
        case orderID = "order_id"
        case roomID = "room_id"
        case prescriptionID = "prescription_id"
        case advertisementID = "advertisement_id"
        case contractID = "contract_id"
        case type
    }
}
