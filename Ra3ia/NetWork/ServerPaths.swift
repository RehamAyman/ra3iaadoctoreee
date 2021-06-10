//
//  ServerPaths.swift
//  SeaTrips
//
//  Created by Sara Mady on 10/27/20.
//  Copyright © 2020 Sara Ashraf. All rights reserved.
//

import Foundation

enum ServerPaths: String {
    //logout
    
    //MARK:- Authntcation APIS:-
    case intros
    case login
    case register
    case verifyPhone = "verify-phone"
    case resendCode = "resend-code"
    case forgotPassword = "forgot-password"
    case resetPassword = "reset-password"
    case profile
    case about
    case agreaments
    case logout
    case animals
    case specialties
    case doctorHome = "doctor-home"
    case doctorRooms = "doctor-rooms"
    case doctorClients = "doctor-clients"
    case doctorPrescriptions = "doctor-prescriptions"
    case doctorSinglePrescription = "doctor-single-prescription"
    case medicines
    case rate
    case doctorStatistics = "doctor-statistics"
    case social
    case contactUs = "contact-us"
    case doctorSingleRoom = "doctor-single-room"
    case updatePrescription = "update-prescription"
    case notifications
    case toggleConnection = "toggle-connection"
    case uploadFile = "upload-file"
    case makePrescription = "make-prescription"
    case finishRoom = "doctor-finish-room"
    case addClientRate = "review"
    case updateProfile = "update-profile"
    
    
    
    //make-prescription
}
