//
//  MedisnModel.swift
//  Ra3ia
//
//  Created by Sara Mady on 14/04/2021.
//

import Foundation
class MedisnModel{
    var id = ""
    var name = ""
    var image = ""
    var price = ""
    var isSelected = "false"
    
    
    
    func getObject(dicc: [String: Any]) -> MedisnModel {
        let dic = HandleJSON.getObject().handle(dicc: dicc)
        let model = MedisnModel()
        model.id = dic["id"] as! String
        model.name = dic["name"] as! String
        model.image = dic["image"] as! String
        model.price = dic["price"] as! String
        model.isSelected = dic["isSelected"] as? String ?? "false"
        return model
        
    }
    
    
    
    
}


import Foundation
class animmalModel{
    var id = ""
    var name = ""
    var image = ""
    var price = ""
    var isSelected = "false"
    
    
    
    func getObject(dicc: [String: Any]) -> MedisnModel {
        let dic = HandleJSON.getObject().handle(dicc: dicc)
        let model = MedisnModel()
        model.id = dic["id"] as! String
        model.name = dic["name"] as! String
        model.image = dic["image"] as! String
        model.price = dic["price"] as! String
        model.isSelected = dic["isSelected"] as? String ?? "false"
        return model
        
    }
    
    
    
    
}
