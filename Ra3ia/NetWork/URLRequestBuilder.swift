//
//  URLRequestBuilder.swift
//  TaxiAwamerCaptain
//
//  Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import Foundation
import Alamofire

protocol URLRequestBuilder: URLRequestConvertible, APIRequestHandler {
    
    var mainURL: URL { get }
    var requestURL: URL { get }
    // MARK: - Path
    var path: ServerPaths { get }
    
    var headers: HTTPHeaders { get }
    // MARK: - Parameters
    var parameters: Parameters? { get }
    
    // MARK: - Methods
    var method: HTTPMethod { get }
    
    var encoding: ParameterEncoding { get }
    
    var urlRequest: URLRequest { get }
    
    var insideUrlParam:[String]? {get}
    
    var fcmTokenDevice: String { get }
}

extension URLRequestBuilder {
    
    var mainURL: URL {
        return URL(string: "https://raaia.4hoste.com/api/")!
    }
    
    
    var headers: HTTPHeaders {
        var header = HTTPHeaders()
        if let token = KeyChain.userToken {
            header["Authorization"] = "Bearer \(token)"
        }
        header["lang"] = AppLanguage.getLang()
        return header
    }
    
    var userToken: String? {
        return KeyChain.userToken
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    var requestURL: URL {
            var mainUrlTemp = mainURL.appendingPathComponent(path.rawValue)
            if insideUrlParam != nil {
                for param in insideUrlParam!{
                    mainUrlTemp =  mainUrlTemp.appendingPathComponent(param)
                }
            }
        print("😇\(mainUrlTemp)")
            return mainUrlTemp
        }
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
        headers.forEach { request.addValue($1, forHTTPHeaderField: $0) }
        return request
    }
    
//    var fcmTokenDevice: String {
//      //  return Messaging.messaging().fcmToken ?? "token"
//    }
    
    func asURLRequest() throws -> URLRequest {
        return try encoding.encode(urlRequest, with: parameters)
    }
}

extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}
