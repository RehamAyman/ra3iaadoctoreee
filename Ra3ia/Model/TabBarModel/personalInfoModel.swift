//
//  personalInfoModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 08/06/2021.
//

import Foundation


// MARK: - ForgetPasswordModel
struct personalInfoModel: Codable,CodableInit {
    let key: String
    let code: Int
    let data: personalInfoData
}

// MARK: - DataClass
struct personalInfoData: Codable {
    let status: String
    let id, toggleNotifications: Int
    let avatar: String
    let accType, fname, lname, name: String
    let email, birthday, phone, connected: String
    let bio: String
    let specialties, animals: [anmil]
    let experiences: [Experiences]
    let auctionName, lat, lng, address: String
    let idImage: String
    let auctionViews, auctionMembers: Int
    let carImage, licenceImage, carType, googlekey: String

    enum CodingKeys: String, CodingKey {
        case status, id, toggleNotifications, avatar
        case accType = "acc_type"
        case fname, lname, name, email, birthday, phone, connected, bio, specialties, animals, experiences
        case auctionName = "auction_name"
        case lat, lng, address
        case idImage = "id_image"
        case auctionViews = "auction_views"
        case auctionMembers = "auction_members"
        case carImage = "car_image"
        case licenceImage = "licence_image"
        case carType = "car_type"
        case googlekey
    }
}

// MARK: - Animal
struct Experiences: Codable {
    let id: Int
    let experience: String
}
