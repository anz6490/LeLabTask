//
//  HomeServiceLayer.swift
//  LeLabTask
//
//  Created by Anees Mv on 29/04/21.
//

import Foundation


struct HomeServiceLayer {
    
    
    static func fetchUserList(urlString:String,
                             completionHandler:CompletionHandlerService?) {
        NetworkManager.getJsonDataFromGET(url: urlString) { (response, data) in
            
            if response == NetworkResponse.success {
                let userList = HomeServiceLayer.parse(json: data)
                if completionHandler != nil {
                    completionHandler!(response, userList)
                }
            } else {
                if completionHandler != nil {
                    completionHandler!(response, nil)
                }
            }
        }
    }
    
    static func parse(json: Data) -> [UserData]? {
        let decoder = JSONDecoder()

        guard let jsonUsers = try? decoder.decode([UserData].self, from: json) else { return nil }
        
        return jsonUsers
    }
}
