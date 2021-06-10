//
//  ChatModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 14/04/2021.
//

import Foundation

// MARK: - AgreamentsModel
struct ChatModel: Codable,CodableInit {
    let key: String
    let code: Int
    let data: ChatData
}

// MARK: - DataClass
struct ChatData: Codable {
    let id, receiverID: Int
    let receiverAvatar: String
    let receiverName: String
    let userID: Int
    let status: String
    let messages: [Message]

    enum CodingKeys: String, CodingKey {
        case id
        case receiverID = "receiver_id"
        case receiverAvatar = "receiver_avatar"
        case receiverName = "receiver_name"
        case userID = "user_id"
        case status, messages
    }
}

// MARK: - Message
struct Message: Codable {
    let id: Int
    let content: String
    let avatar: String
    let type, createdAt: String
    let sentByMe: Int

    enum CodingKeys: String, CodingKey {
        case id, content, avatar, type
        case createdAt = "created_at"
        case sentByMe = "sent_by_me"
    }
}
