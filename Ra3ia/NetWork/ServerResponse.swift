//
//  ServerResponse.swift
//  TaxiAwamerCaptain
//
//  Created by Sara Ashraf on 11/18/19.
//  Copyright © 2019 aait. All rights reserved.
//

import Foundation
enum ServerResponse<T> {
    case success(T), failure(LocalizedError?), unAuthorized(LocalizedError?),errorResponse(LocalizedError?)
}
