//
//  DataController.swift
//  List
//
//  Created by U. Lind Mortensen on 13/12/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "ItemModel")
    
    init(){
        container.loadPersistentStores { desc, error in
            if let error = error{
                print("Failed to load the date \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
            print("Data saved !!! yeahh")
        } catch{
            print("We could not save the data...")
        }
    }
    
    func  addItem(name: String, mycolor: Int16, context: NSManagedObjectContext){
        let item = MyItem(context: context)
        item.id = UUID()
        item.date = Date()
        item.state = false
        item.name = name
        item.mycolor = mycolor
        
        save(context: context)
    }
}
