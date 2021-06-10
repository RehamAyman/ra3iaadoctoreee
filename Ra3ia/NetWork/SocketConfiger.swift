//
//  SocketConfiger.swift
//  3lSaree3
//
//  Created by Sara Ashraf on 3/11/20.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//
//

import Foundation
import SocketIO
struct SocketConnection {
    
    public static let sharedInstance = SocketConnection()
    let manager: SocketManager
    public var socket: SocketIOClient
    //marsol-aait.4hoste.com
    private init() {
        manager = SocketManager(socketURL: URL(string: "https://raaia.4hoste.com:4549")!, config: [.log(false)])
        socket = manager.defaultSocket
    }
}

