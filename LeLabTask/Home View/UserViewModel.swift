//
//  UserViewModel.swift
//  LeLabTask
//
//  Created by Anees Mv on 29/04/21.
//

import Foundation


struct UserViewModel {
    var id: Int
    var name: String
    var phone: String
    var username: String
    var email: String
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    var companyName: String
    var catchPhrase: String
    var bs: String
    
    init(id: Int,
         name: String,
         phone: String,
         username: String,
         email: String,
         street: String,
         suite: String,
         city: String,
         zipcode: String,
         companyName: String,
         catchPhrase: String,
         bs: String) {
        self.id = id
        self.name = name
        self.phone = phone
        self.username = username
        self.email = email
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.companyName = companyName
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
    
    init(userData:UserData) {
        self.id = userData.id
        self.name = userData.name
        self.phone = userData.phone
        self.username = userData.username
        self.email = userData.email
        self.street = userData.address.street
        self.suite = userData.address.suite
        self.city = userData.address.city
        self.zipcode = userData.address.zipcode
        self.companyName = userData.company.name
        self.catchPhrase = userData.company.catchPhrase
        self.bs = userData.company.bs
    }
}
