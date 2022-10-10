//
//  Persistent.swift
//  HIITFit
//
//  Created by Mars on 2022/10/7.
//
import CoreData
import Foundation

struct PersistentController {
  let container: NSPersistentContainer
  
  init(name: String) {
    container = NSPersistentContainer(name: name)
    
    container.loadPersistentStores { store, error in
      if let error = error as? NSError {
        fatalError("Container load failed: \(error.localizedDescription)")
      }
    }
    
    #if DEBUG
    //createDevData()
    #endif
  }
  
  func createDevData() {
    container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    let context = container.viewContext
    
    let h1 = History(context: context)
    h1.date = Date().addingTimeInterval(-86400)
    
    let exec1 = [
      Exercise.exercises[0],
      Exercise.exercises[1],
      Exercise.exercises[2]
    ]
    
    let data1 = try! JSONEncoder().encode(exec1)
    h1.exercises = String(decoding: data1, as: UTF8.self)
    
    
    let h2 = History(context: context)
    h2.date = Date().addingTimeInterval(-86400 * 2)
    
    let exec2 = [
      Exercise.exercises[0],
      Exercise.exercises[1]
    ]
    
    let data2 = try! JSONEncoder().encode(exec2)
    h2.exercises = String(decoding: data2, as: UTF8.self)
    
    try? context.save()
  }
}
