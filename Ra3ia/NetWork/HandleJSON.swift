//
//  HandleJSON.swift
//  Quick
//
//  Created by Sara Ashraf on 5/7/19.
//  Copyright © 2019 Sara Ashraf. All rights reserved.
//

import Foundation

class HandleJSON {
    static var object:HandleJSON? = nil
    static func getObject() -> HandleJSON {
        if (HandleJSON.object == nil) {
            HandleJSON.object = HandleJSON()
        }
        return HandleJSON.object!
    }
    
    func handle(dicc: [String: Any]) -> [String: Any] {
        var dic = dicc
        for (key, value) in (dic) {
            if value is NSNull {
                dic[key] = "" as Any
            } else if value is Int {
                let temp : Int =  value as! Int
                dic[key] = String(temp)
            } else if value is Double {
                let temp : Double = value as! Double
                dic[key] = String(temp)
            }
        }
        return dic
    }
}
