//
//  List.swift
//  List
//
//  Created by Herbert Lind Bjerre on 04/12/2022.
//

import Foundation

struct Listitem : Identifiable {
    var name = ""
    var state = false
    var id = UUID()  //Gives each item an unique id
/*    init(name: String = "", state: Bool = false, id: UUID = UUID()) {
        self.name = name
        self.state = state
        self.id = id*/
    
}

class List : ObservableObject {
    @Published var listitem = [
        Listitem(name: "Mobil", state: false),
        Listitem(name: "Computer", state: false)
        ]
    
}
