//
//  ConverstionModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 06/04/2021.
//


import Foundation

// MARK: - HomeModel
struct ConverstionModel: Codable,CodableInit {
    let key: String
    let code: Int
    let data: ConverstionData
}

// MARK: - DataClass
struct ConverstionData: Codable {
    let activeRooms: [NewRoom]
    let finishedRooms: [NewRoom]

    enum CodingKeys: String, CodingKey {
        case activeRooms = "active_rooms"
        case finishedRooms = "finished_rooms"
    }
}
