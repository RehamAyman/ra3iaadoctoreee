//
//  HomeModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 05/04/2021.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let homeModel = try? newJSONDecoder().decode(HomeModel.self, from: jsonData)

import Foundation

// MARK: - HomeModel
struct HomeModel: Codable,CodableInit {
    let key: String
    let code: Int
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id, toggleNotifications: Int
    let avatar: String
    let accType, fname, lname, name: String
    let rate: String
    let newRooms: [NewRoom]

    enum CodingKeys: String, CodingKey {
        case id, toggleNotifications, avatar
        case accType = "acc_type"
        case fname, lname, name, rate
        case newRooms = "new_rooms"
    }
}

// MARK: - NewRoom
struct NewRoom: Codable {
    let id: Int
    let senderName: String
    let senderAvatar: String
    let lastMessageCreatedAt, lastMessageContent: String

    enum CodingKeys: String, CodingKey {
        case id
        case senderName = "sender_name"
        case senderAvatar = "sender_avatar"
        case lastMessageCreatedAt = "last_message_created_at"
        case lastMessageContent = "last_message_content"
    }
}
