//
//  CoreDataService.swift
//  Health Tracker
//
//  Created by Roman Khodukin on 10.06.2020.
//  Copyright © 2020 Roman Khodukin. All rights reserved.
//

import CoreData

class CoreDataService {
    
    static let instance = CoreDataService()
    
    private init(){}
    
    var context: NSManagedObjectContext {
        get {
            return persistentContainer.viewContext
        }
    }
    
    private(set) lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "AppModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
