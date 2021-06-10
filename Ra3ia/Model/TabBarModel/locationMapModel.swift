//
//  locationMapModel.swift
//  Ra3ia
//
//  Created bySara Mady on 6/6/21.
//

import Foundation
struct LocationMapModel {
    var lat:Double
    var addresse:String
    var lang:Double
    
    func toDic()->[String:Any]{
        let dic = [
            "addresse":addresse,
            "lat":lat,
            "lang":lang
            ] as [String : Any]
        return dic
    }
}
