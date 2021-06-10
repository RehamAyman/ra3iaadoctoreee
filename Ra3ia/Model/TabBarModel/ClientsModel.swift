//
//  ClientsModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 07/04/2021.
//

import Foundation


// MARK: - ClientsModel
struct ClientsModel: Codable,CodableInit {
    let key: String
    let code: Int
    let data: ClientData
}

// MARK: - DataClass
struct ClientData: Codable {
    let activeClients: [Client]
    let finishedClients: [Client]

    enum CodingKeys: String, CodingKey {
        case activeClients = "active_clients"
        case finishedClients = "finished_clients"
    }
}

// MARK: - ActiveClient
struct Client: Codable {
    let senderName: String
    let senderAvatar: String
    let rate: String

    enum CodingKeys: String, CodingKey {
        case senderName = "sender_name"
        case senderAvatar = "sender_avatar"
        case rate
    }
}
