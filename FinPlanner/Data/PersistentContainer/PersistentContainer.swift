//
//  PersistentContainer.swift
//  FinPlanner
//
//  Created by Никита Коголенок on 14.01.26.
//

import Foundation
import CoreData

class PersistentContainer {
    static let shared = PersistentContainer()
    private init() { }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "db")
        container.loadPersistentStores(completionHandler: { (storeDecription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
