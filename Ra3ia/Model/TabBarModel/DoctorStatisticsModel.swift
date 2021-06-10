//
//  DoctorStatisticsModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 12/04/2021.
//

import Foundation

// MARK: - MedisinModel
struct DoctorStatisticsModel: Codable,CodableInit {
    let key: String
    let code: Int
    let data: DoctorStatisticsData
}

// MARK: - DataClass
struct DoctorStatisticsData: Codable {
    let roomsCount, acceptedPrescriptionsCount: Int
    let profits: String
    let rooms: [NewRoom]

    enum CodingKeys: String, CodingKey {
        case roomsCount = "rooms_count"
        case acceptedPrescriptionsCount = "accepted_prescriptions_count"
        case profits, rooms
    }
}
