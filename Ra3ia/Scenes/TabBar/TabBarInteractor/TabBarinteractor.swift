//
//  TabBarinteractor.swift
//  Ra3ia
//
//  Created by Sara Mady on 05/04/2021.
//

import Foundation
import Alamofire

enum TabBarinteractor: URLRequestBuilder {
  
    
    case doctorHome
    case doctorRooms
    case doctorClits
    case doctorPrescriptions
    case doctorSinglePrescription(id:Int)
    case medicines(animals:[Int])
    case rate
    case doctorStatistics
    case social
    case about
    case agreaments
    case contactUs(type:String,subject:String,content:String)
    case logout(device_id:String)
    case doctorSingleRoom(id:Int)
    case updatePrescription(id: String ,medicines:[Int],deletedmedicines:[Int])
    case notifications
    case toggleConnection
    case uploadFile
    case makePrescription ( room_id : Int , user_id : Int , medicines : [Int] )
    case finishRoom ( id : Int)
    case profile
    case addClientRate ( seconduser_id : Int , value : Int )
    case updateProfile ( fname : String , lname : String , email : String , phone : String , birthday : String  , specialties : String , animals : String , experiences :[String] , bio : String
         )
    
    
    
    
    
    
    // MARK: - Paths
    internal var path: ServerPaths {
    
        switch self {
        case .doctorHome:
            return .doctorHome
        case .doctorRooms:
            return .doctorRooms
        case .doctorClits:
            return .doctorClients
        case .doctorPrescriptions:
            return .doctorPrescriptions
        case .doctorSinglePrescription:
            return .doctorSinglePrescription
        case .medicines:
            return .medicines
        case .rate:
            return .rate
        case .doctorStatistics:
            return .doctorStatistics
        case .social:
            return .social
        case .about:
            return .about
        case .agreaments:
            return .agreaments
        case .contactUs:
            return .contactUs
        case .logout:
            return .logout
        case .doctorSingleRoom:
            return .doctorSingleRoom
        case .updatePrescription:
            return .updatePrescription
        case .notifications:
            return .notifications
        case .toggleConnection:
            return .toggleConnection
        case .uploadFile:
            return .uploadFile
        case .profile:
            return .profile
        case .makePrescription :
            return .makePrescription
        case .finishRoom :
            return .finishRoom
        case .addClientRate :
            return .addClientRate
            
        case .updateProfile:
            return .updateProfile
            
        }
    }
    
    // MARK: - Parameters
    internal var parameters: Parameters? {
        var params = Parameters()
        switch self {
        case .doctorHome,.doctorRooms,.doctorClits,.doctorPrescriptions,.doctorSinglePrescription,.rate,.doctorStatistics,.social,.agreaments,.about,.doctorSingleRoom,.notifications,.toggleConnection , .uploadFile,.profile:
            break
        case .contactUs(type: let type, subject: let subject, content: let content):
            params["type"] = type
            params["subject"] = subject
            params["content"] = content
        case .medicines(animals: let animals):
            params["animals"] = animals
        case .logout(device_id: let device_id):
            params["device_id"] = device_id
         case .updatePrescription(id: let id, medicines: let medicines, deletedmedicines: let deletedmedicines):
            params["id"] = id
            if(medicines.count != 0){
                params["medicines"] = "\(medicines)"
               
            }
            
            if(deletedmedicines.count != 0){
           params["deletedmedicines"] = "\(deletedmedicines)"
                      }
            
            
        case .makePrescription(room_id: let room_id , user_id: let user_id, medicines: let medicines ):
            params["room_id"] = room_id
            params ["user_id"] = user_id
            
            params["medicines"] = medicines
        
            if(medicines.count != 0){
                params["medicines"] = "\(medicines)"
               
            }
        case .finishRoom(id: let id ):
             params ["id"] = id
            
        case .addClientRate(seconduser_id: let seconduser_id , value: let value ):
            params ["seconduser_id"] = seconduser_id
            params ["value"] = value
            
        case .updateProfile(fname: let fname , lname: let lname, email: let email , phone: let phone, birthday: let birthday, specialties: let specialties , animals: let animals, experiences: let experiences , bio: let bio):
            params["fname"] = fname
            params["lname"] = lname
            params["email"] = email
            params["phone"] = phone
            params["birthday"] = birthday
            params["specialties"] = specialties
            params["animals"] = animals
            params["experiences"] = experiences
            params["bio"] = bio
            
            
            
          
         }

      
        print("☠️\(params)")
        return params
        
    }
    
    
    internal var insideUrlParam: [String]?{
        switch self {
        case .doctorSinglePrescription(id:let id):
            return ["\(id)"]
        case .doctorSingleRoom(id:let id):
            return ["\(id)"]
        default:
            return nil
        }
    }
    
    internal var headers: HTTPHeaders{
        var header = HTTPHeaders()
        switch self {
        
        default:
          
            if let token = KeyChain.userToken {
                print("📕\(token)")
                header["Authorization"] = "Bearer \(token)"
            }
            header["lang"] = AppLanguage.getLang()
            
        }
        
        return header
    }
    
    var fcmTokenDevice: String {
        return  "token"
    }
    
    // MARK: - Method
    
    internal var method: HTTPMethod {
        switch self {
        case .doctorHome,.doctorRooms,.doctorClits,.doctorPrescriptions,.doctorSinglePrescription,.medicines,.rate,.doctorStatistics,.social,.agreaments,.about,.doctorSingleRoom,.notifications,.profile:
            return .get
        default:
            return .post
        }
    }
    
    // MARK: - Encoding
    
    internal var encoding: ParameterEncoding {
        switch self {
        case .doctorHome,.doctorRooms,.doctorClits,.doctorPrescriptions,.doctorSinglePrescription,.rate,.medicines,.doctorStatistics,.social,.agreaments,.about,.doctorSingleRoom,.notifications,.profile:
            return URLEncoding.default
       
            
        default:
            return JSONEncoding.default
        }
    }
}
