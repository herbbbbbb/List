//
//  ListApp.swift
//  List
//
//  Created by Herbert Lind Bjerre on 04/12/2022.
//

import SwiftUI

@main
struct ListApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
