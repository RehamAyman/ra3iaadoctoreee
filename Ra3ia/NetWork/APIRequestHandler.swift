//
//  APIRequestHandler.swift
//  TaxiAwamerCaptain
//
//  Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import Foundation
import Alamofire

typealias CallResponse<T> = ((ServerResponse<T>) -> Void)?

protocol APIRequestHandler: HandleAlamoResponse {
    
}

struct UploadData {
    var data: Data
    var fileName, mimeType, name: String
}

extension APIRequestHandler {
    
    private func uploadToServerWith<T: CodableInit>(_ decoder: T.Type, data: [UploadData], request: URLRequestConvertible, parameters: Parameters?, progress: ((Progress) -> Void)?, completion: CallResponse<T>) {
        
        upload(multipartFormData: { mul in
            for d in data{
            mul.append(d.data, withName: d.name, fileName: d.fileName, mimeType: d.mimeType)
            }
            guard let parameters = parameters else { return }
            for (key, value) in parameters {
                mul.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
        }, with: request) { response in
            switch response {
            case .success(let requestUp, _, _):
                requestUp.responseData(completionHandler: { results in
                    self.handleResponse(results, completion: completion)
                }).responseString(completionHandler: { string in
                    print(string.result.value as Any)
                })
                
            case .failure(let error):
                completion?(ServerResponse<T>.failure(error as? LocalizedError))
            }
            
        }
    }
    
    
    
    @available(*, deprecated: 0)
    func callServerWith<T: CodableInit>(_ decoder: T.Type, requestURL: URLRequestConvertible, data: [UploadData]? = nil, progress: ((Progress) -> Void)? = nil, completion: CallResponse<T>) {
        if let data = data {
            uploadToServerWith(decoder, data: data, request: requestURL, parameters: nil, progress: progress, completion: completion)
        } else {
            request(requestURL).validate().responseData { response in
                self.handleResponse(response, completion: completion)
            }
        }
    }
}

extension APIRequestHandler where Self: URLRequestBuilder {
    func send<T: CodableInit>(_ decoder: T.Type, data: [UploadData]? = nil, progress: ((Progress) -> Void)? = nil, debug: ((DataResponse<Any>) -> Void)? = nil, completion: CallResponse<T>) {
        if let data = data {
            uploadToServerWith(decoder, data: data, request: self, parameters: self.parameters, progress: progress, completion: completion)
        } else {
            request(self).validate().responseData {
                self.handleResponse($0, completion: completion)
                }.responseJSON { results in
                    debug?(results)
                    
                    let res = results.result.value as? [String: Any]
                    print(res?["key"] as Any)
                    if (res != nil){
                        
                        print(res!)
                      
                    }
                    
            }
        }
    }
}
