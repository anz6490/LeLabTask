//
//  HomeViewModel.swift
//  LeLabTask
//
//  Created by Anees Mv on 29/04/21.
//

import Foundation

class HomeViewModel {
    
    var userList:[UserViewModel]?
    
    init() {
        guard let users = DataManager.sharedManager.fetchUserData() else {
            if let users =  self.getUserData() {
                userList = users
            }
            return
        }
        userList = users
    }
    
    
    func getUserData() -> [UserViewModel]? {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        var users:[UserViewModel]?
        HomeServiceLayer.fetchUserList(urlString: urlString) { (response, userData) in
            guard let userList = userData as? [UserData] else { return }
            users = userList.map({ (item) -> UserViewModel in
                return UserViewModel(userData: item)
            })
        }
        if users != nil {
            DataManager.sharedManager.save(userData: users!)
        }
        return users
    }

}
