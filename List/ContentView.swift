//
//  ContentView.swift
//  List
//
//  Created by Herbert Lind Bjerre on 04/12/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var data : List
    
    var body: some View {
        NavigationStack{
            
            
            Form {
                
                ForEach($data.listitem){$Listitem in
                    Toggle(Listitem.name, isOn: $Listitem.state)
                }
                .onDelete { indexSet in
                    data.listitem.remove(atOffsets: indexSet)
                }
                
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink("Add") {
                        ListitemView()
                            .navigationTitle("Add Item")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(List())
    }
}
