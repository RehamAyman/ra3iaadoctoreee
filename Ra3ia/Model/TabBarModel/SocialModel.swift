//
//  SocialModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 13/04/2021.
//

import Foundation

// MARK: - MedisinModel
struct SocialModel: Codable ,CodableInit{
    let key: String
    let code: Int
    let data: SocialData
}

// MARK: - DataClass
struct SocialData: Codable {
    let email, phone, whatsapp, facebook: String
    let twitter, instagram, linkedin: String
}
