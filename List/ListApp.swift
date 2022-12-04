//
//  ListApp.swift
//  List
//
//  Created by Herbert Lind Bjerre on 04/12/2022.
//

import SwiftUI

@main
struct ListApp: App {
    @StateObject var data = List()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(List())
        }
    }
}
