//
//  CoreDataManager.swift
//  PigManagement
//
//  Created by Tan Yee Gene on 24/02/2021.
//

import CoreData
import UIKit

struct CoreDataManager {
    static let shared = CoreDataManager()

    let persistentContainer: NSPersistentContainer = {
        let pc = NSPersistentContainer(name: "PigManagement")
        pc.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                print("Failed to load persistentContainer: ", error)
            }
        }
        return pc
    }()

    func createSow(name: String, entryDate: String?, parity: String?) -> (Sow?, Error?) {
        let context = persistentContainer.viewContext
        let sow = NSEntityDescription.insertNewObject(forEntityName: "Sow", into: context) as! Sow
        sow.name = name
        sow.parity = parity
        sow.entryDate = entryDate
        context.insert(sow)
        do {
            try context.save()
            return (sow, nil)
        } catch let error {
            print("Failed to save created Sow context: ", error)
            return (nil, error)
        }
    }

    func performSowFetch() -> [Sow] {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Sow> = Sow.fetchRequest()
        do {
            let sows = try context.fetch(fetchRequest)
            return sows
        } catch let sowFetchErrors {
            print("Failed to fetch sows: ",sowFetchErrors)
            return []
        }
    }
}
