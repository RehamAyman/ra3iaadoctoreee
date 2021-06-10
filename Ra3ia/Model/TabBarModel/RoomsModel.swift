//
//  RoomsModel.swift
//  Ra3ia
//
//  Created bySara Mady on 6/7/21.
//

import Foundation


struct RooomsModel : Codable , CodableInit {
    let key : String
    let code : Int
    let data : RoomsData

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case code = "code"
        case data = "data"
    }
}

struct RoomsData : Codable {
    let active_rooms : [Active_rooms]
    let finished_rooms : [finished_rooms]

    enum CodingKeys: String, CodingKey {

        case active_rooms = "active_rooms"
        case finished_rooms = "finished_rooms"
    }
}

struct Active_rooms : Codable {
    let id : Int
    let sender_name : String
    let rate : String
    let sender_avatar : String
    let last_message_created_at : String
    let last_message_content : String
    let last_message_id : Int
    

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case sender_name = "sender_name"
        case rate = "rate"
        case sender_avatar = "sender_avatar"
        case last_message_created_at = "last_message_created_at"
        case last_message_content = "last_message_content"
        case last_message_id = "last_message_id"
    }
}
    struct finished_rooms : Codable {
        let id : Int
        let sender_name : String
        let rate : String
        let sender_avatar : String
        let last_message_created_at : String
        let last_message_content : String
        let last_message_id : Int

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case sender_name = "sender_name"
            case rate = "rate"
            case sender_avatar = "sender_avatar"
            case last_message_created_at = "last_message_created_at"
            case last_message_content = "last_message_content"
            case last_message_id = "last_message_id"
        }
    
}


