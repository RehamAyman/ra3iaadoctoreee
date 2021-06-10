//
//  AuthntcationInteractor.swift
//  Ra3ia
//
//  Created by Sara Mady on 04/04/2021.
//

import Foundation
import Alamofire

enum AuthntcationInteractor: URLRequestBuilder {
    
    case Login(phoneoremail:String,password:String,device_id:String,device_type:String,app_type:String)
    
    case Register(fname:String,lname:String,email:String,phone:String,birthday:String,password:String,device_id:String,device_type:String,acc_type:String,specialties:String,animals:String)
    
    case VerfyPhone(v_code:String)
    
    case resendCode
    
    case ForgetPassword(phone:String)
    
    case resetPassword(phone:String,v_code:String,password:String)
    
    case LogOut(device_id:String)
    
    case animals
    
    case specialties
    
    
    // MARK: - Paths
    internal var path: ServerPaths {
        
        switch self {
        case .Login:
            return .login
        case .animals:
            return .animals
        case .Register:
            return .register
        case .VerfyPhone:
            return .verifyPhone
        case .resendCode:
            return .resendCode
        case.ForgetPassword:
            return .forgotPassword
        case.resetPassword:
            return .resetPassword
        case .LogOut:
            return .logout
        case .specialties:
            return .specialties
        
        }
    }
    
    // MARK: - Parameters
    internal var parameters: Parameters? {
        var params = Parameters()
        
        switch self {
        case .Login(phoneoremail:let phoneoremail,password:let password,device_id: let device_id,device_type: let device_type,app_type:let app_type):
            params["phoneoremail"] = phoneoremail
            params["password"] = password
            params["device_id"] = device_id
            params["device_type"] = device_type
            params["app_type"] = app_type
            
        case .Register(fname: let fname, lname: let lname , email: let email, phone: let phone, birthday: let birthday, password: let password, device_id: let device_id, device_type: let device_type, acc_type: let acc_type ,specialties:let specialties,animals:let animals):
            // fname  lname  email   phone   birthday password  device_id  device_type  acc_type  specialties animals
            params["fname"] = fname
            params["lname"] = lname
            params["email"] = email
            params["phone"] = phone
            params["birthday"] = birthday
            params["password"] = password
            params["device_id"] = device_id
            params["device_type"] = device_type
            params["acc_type"] = acc_type
            params["animals"] = animals
            params["specialties"] = specialties
            
        case .VerfyPhone(v_code:let v_code):
            params["v_code"] = v_code
        case .ForgetPassword(phone: let phone):
            params["phone"] = phone
        case .resetPassword(phone: let phone, v_code: let v_code, password: let password):
            params["phone"] = phone
            params["v_code"] = v_code
            params["password"] = password
        case .LogOut(device_id: let device_id):
            params["device_id"] = device_id
            
        case .resendCode,.animals,.specialties:
            break
       
       
        }
        print("☠️\(params)")
        return params
        
    }
    
    
    internal var insideUrlParam: [String]?{
        switch self {
     
        default:
            return nil
        }
    }
    
    internal var headers: HTTPHeaders{
        var header = HTTPHeaders()
        switch self {
        
        default:
            if let token = KeyChain.userToken {
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
        case .animals,.specialties:
            return .get
        default:
            return .post
        }
    }
    
    // MARK: - Encoding
    
    internal var encoding: ParameterEncoding {
        switch self {
        case .animals,.specialties:
            return URLEncoding.default

        default:
            return JSONEncoding.default
        }
    }
}
