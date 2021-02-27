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


    // create sow also automatically create service and default is open.
    func createSow(name: String, entryDate: String?, parity: String?) -> (Sow?, Error?) {
        let context = persistentContainer.viewContext
        let sow = NSEntityDescription.insertNewObject(forEntityName: "Sow", into: context) as! Sow
        sow.name = name
        sow.parity = parity
        sow.entryDate = entryDate

        // Set default stage of sow to open when created.
        // Set batch number to 0 when first created sow.

        sow.stage = "open"
        sow.batch = "1"
        context.insert(sow)
        do {
            try context.save()
            return (sow, nil)
        } catch let error {
            print("Failed to save created Sow context: ", error)
            return (nil, error)
        }
    }

//    func createService(

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

    func deleteSow(sow:Sow) {
        let context = persistentContainer.viewContext
        context.delete(sow)
        do {
            try context.save()
        } catch let deleteError {
            print("Failed to delete sow: ", deleteError)
        }
    }
}
