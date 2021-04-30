//
//  ViewController.swift
//  LeLabTask
//
//  Created by Anees Mv on 28/04/21.
//

import UIKit


class ViewController: UIViewController {

    var users = [UserData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://jsonplaceholder.typicode.com/users"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // we're OK to parse!
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonUsers = try? decoder.decode([UserData].self, from: json) {
            users = jsonUsers
//            tableView.reloadData()
        }
    }


}

