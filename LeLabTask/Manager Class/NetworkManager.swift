//
//  NetworkManager.swift
//  LeLabTask
//
//  Created by Anees Mv on 29/04/21.
//

import Foundation

enum NetworkResponse: String, Codable {
    case success
    case failed
}

typealias CompletionHandlerNetwork = (_ response: NetworkResponse, _ json: Data) -> Void
typealias CompletionHandlerService = (_ response: NetworkResponse, _ data: Any?) -> Void

struct NetworkManager {
    
    public static func getJsonDataFromGET(url:String,
                                          completionHandlerWithJson: CompletionHandlerNetwork?) {
        if let url = URL(string: url) {
            if let data = try? Data(contentsOf: url) {
//                if actionCode == "000" {
                    if let completionHandlerWithJson = completionHandlerWithJson {
                        completionHandlerWithJson(NetworkResponse.success, data)
                    }
//                } else {
//                  if let completionHandlerWithJson = completionHandlerWithJson {
//                      completionHandlerWithJson(NetworkResponse.failed
//                  }
//                }
            }
        }
    }
}
