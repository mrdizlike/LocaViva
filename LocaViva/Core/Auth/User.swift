//
//  User.swift
//  LocaViva
//
//  Created by Виктор on 30.06.2023.
//

import Foundation

struct UserData: Identifiable, Codable {
    let id: String
    let email: String
    let phoneNumber: String
    let firstName: String
    let lastName: String
    let country: String
}

