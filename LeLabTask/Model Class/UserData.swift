//
//  UserData.swift
//  LeLabTask
//
//  Created by Anees Mv on 29/04/21.
//

import Foundation

struct UserData: Codable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var company: Company
    var phone: String
    var website: String
}
