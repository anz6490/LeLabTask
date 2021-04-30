//
//  StorageManager.swift
//  LeLabTask
//
//  Created by Anees Mv on 30/04/21.
//

import Foundation
import UIKit
import CoreData


class DataManager {
    
    static let sharedManager = DataManager()
    
    func save(userData:[UserViewModel]) {
        clearCache()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "UserData", in: managedContext)
        
        for user in userData {
            let cardEntity = NSManagedObject(entity: entity!, insertInto: managedContext)
            
            cardEntity.setValue(user.id, forKey: "id")
            cardEntity.setValue(user.name, forKey: "name")
            cardEntity.setValue(user.phone, forKey: "phone")
            cardEntity.setValue(user.username, forKey: "username")
            cardEntity.setValue(user.email, forKey: "email")
            cardEntity.setValue(user.street, forKey: "street")
            cardEntity.setValue(user.suite, forKey: "suite")
            cardEntity.setValue(user.city, forKey: "city")
            cardEntity.setValue(user.zipcode, forKey: "zipcode")
            cardEntity.setValue(user.companyName, forKey: "companyName")
            cardEntity.setValue(user.catchPhrase, forKey: "catchPhrase")
            cardEntity.setValue(user.bs, forKey: "bs")
            
            do {
                try managedContext.save()
                print("Card Saved succesfully")
            } catch {
                print(error)
            }
        }
    }
    
    func fetchUserData()->[UserViewModel]? {
        var userList:[UserViewModel] = []
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserData")
        do {
            let results = try managedContext.fetch(fetchRequest)
            guard results.count > 0 else {
                print("No saved UserData found")
                return nil
            }
            for (_,user) in results.enumerated() {
                let id = user.value(forKey: "id") as! Int
                let name = user.value(forKey: "name") as! String
                let phone = user.value(forKey: "phone") as! String
                let username = user.value(forKey: "username") as! String
                let email = user.value(forKey: "email") as! String
                let street = user.value(forKey: "street") as! String
                let suite = user.value(forKey: "suite") as! String
                let city = user.value(forKey: "city") as! String
                let zipcode = user.value(forKey: "zipcode") as! String
                let companyName = user.value(forKey: "companyName") as! String
                let catchPhrase = user.value(forKey: "catchPhrase") as! String
                let bs = user.value(forKey: "bs") as! String
                
                userList.append(UserViewModel(id: id,
                                               name: name,
                                               phone: phone,
                                               username: username,
                                               email: email,
                                               street: street,
                                               suite: suite,
                                               city: city,
                                               zipcode: zipcode,
                                               companyName: companyName,
                                               catchPhrase: catchPhrase,
                                               bs: bs))
                
                
            }
        } catch let error as NSError {
            print("Could not fetch cards list. \(error), \(error.userInfo)")
        }
        
        return userList
    }
    
    func clearCache() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let pStoreCordinator = appDelegate.persistentContainer.persistentStoreCoordinator
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserData")
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try pStoreCordinator.execute(deleteRequest, with: managedContext)
        } catch _ as NSError {
            // TODO: handle the error
        }
    }
}
