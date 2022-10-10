//
//  HIITFitApp.swift
//  HIITFit
//
//  Created by Mars on 2022/10/2.
//

import SwiftUI

@main
struct HIITFitApp: App {
  let ratingController = PersistentController(name: "HIIT")
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.managedObjectContext, ratingController.container.viewContext)
    }
  }
}
