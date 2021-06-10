//
//  updateProfileModel.swift
//  Ra3ia
//
//  Created by Reham Ayman on 6/10/21.
//

import Foundation




struct updateProfileModel : Codable  , CodableInit {
    
    
    let key : String
    let status : String?
    let code : Int
    let msg : String
    let data : updateProfileDData?

    enum CodingKeys: String, CodingKey {

        case key = "key"
        case status = "status"
        case code = "code"
        case msg = "msg"
        case data = "data"
    }}

struct updateProfileDData : Codable {
    let status : String
    let id : Int
    let toggleNotifications : Int
    let avatar : String
    let acc_type : String
    let fname : String
    let lname : String
    let name : String
    let email : String
    let birthday : String
    let phone : String
    let connected : String
    let bio : String
    let specialties : [Specialtiess]
    let animals : [Animalss]
    let experiences : [ExperiencesDData]
    let auction_name : String
    let lat : String
    let lng : String
    let address : String
    let id_image : String
    let auction_views : Int
    let auction_members : Int
    let car_image : String
    let licence_image : String
    let car_type : String
    let googlekey : String

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case id = "id"
        case toggleNotifications = "toggleNotifications"
        case avatar = "avatar"
        case acc_type = "acc_type"
        case fname = "fname"
        case lname = "lname"
        case name = "name"
        case email = "email"
        case birthday = "birthday"
        case phone = "phone"
        case connected = "connected"
        case bio = "bio"
        case specialties = "specialties"
        case animals = "animals"
        case experiences = "experiences"
        case auction_name = "auction_name"
        case lat = "lat"
        case lng = "lng"
        case address = "address"
        case id_image = "id_image"
        case auction_views = "auction_views"
        case auction_members = "auction_members"
        case car_image = "car_image"
        case licence_image = "licence_image"
        case car_type = "car_type"
        case googlekey = "googlekey"
    }
}
struct ExperiencesDData : Codable {
    let id : Int?
    let experience : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case experience = "experience"
    }}

struct Animalss : Codable {
    let id : Int?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
    }}
struct Specialtiess : Codable {
    let id : Int?
    let name : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
    }}

