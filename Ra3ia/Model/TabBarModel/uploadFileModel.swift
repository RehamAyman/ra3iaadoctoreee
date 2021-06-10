//
//  uploadFileModel.swift
//  Ra3ia
//
//  Created bySara Mady on 6/6/21.
//

import Foundation
// MARK: - ForgetPasswordModel
struct uploadFileModel: Codable ,CodableInit{
    let key: String
    let code: Int
    let data: uploadData
}

// MARK: - DataClass
struct uploadData: Codable {
    let name: String
    let url: String
}
