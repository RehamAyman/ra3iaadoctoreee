//
//  ResponseHandler.swift
//  TaxiAwamerCaptain
//
//  Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import Foundation
import Alamofire

protocol HandleAlamoResponse {
    func handleResponse<T: CodableInit>(_ response: DataResponse<Data>, completion: CallResponse<T>)
}

extension HandleAlamoResponse {
    
    func handleResponse<T: CodableInit>(_ response: DataResponse<Data>, completion: CallResponse<T>) {
        switch response.result {
        
        case .failure(let error):
            completion?(ServerResponse<T>.failure(error as? LocalizedError))
        case .success(let value):
            do {
                let dresponse = try DefaultResponse(data: value)
                if dresponse.code == 200{
                    let modules = try T(data: value)
                    completion?(ServerResponse<T>.success(modules))
                }else if dresponse.code == 419{
                    
                    SocketConnection.sharedInstance.socket.disconnect()
                    KeyChain.deleteToken()
                    User.currentUser = nil
                    guard let window = UIApplication.shared.keyWindow else { return }
                    let vc = UIStoryboard.instantiateInitialViewController(.Main)
                    UIApplication.shared.keyWindow?.setRootViewController(vc)
                    
                    completion?(ServerResponse<T>.unAuthorized(APIError.unkownError(message: dresponse.msg ?? "UnAuthorized".localized)))
                }else if dresponse.code == 401{
                    completion?(ServerResponse<T>.errorResponse(APIError.unkownError(message: dresponse.msg ?? "Error".localized)))
                } else {
                    completion?(ServerResponse<T>.failure(APIError.unkownError(message: dresponse.msg ?? "Bad Internet".localized)))
                }
            } catch {
                completion?(ServerResponse<T>.failure(error as? LocalizedError))
            }
        }
    }
}
