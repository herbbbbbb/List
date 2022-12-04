//
//  ListitemView.swift
//  ItemList
//
//  Created by U. Lind Mortensen on 03/12/2022.
//

import SwiftUI

struct ListitemView: View {
    @State var newListItem : Listitem = Listitem(name: "Hej", state: false, id: UUID())
    @EnvironmentObject var data : List
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            VStack(alignment: .leading) {
                Form {
                    Section("Name") {
                        TextField("Name", text: $newListItem.name)
                        
                    }

                }
                
            }
            
            .toolbar {
                ToolbarItem {
                    Button("Add") {
                        
                        data.listitem.append(newListItem)
                        dismiss()
                    }
                }
            
        }
    }
}

struct ListitemView_Previews: PreviewProvider {
    static var previews: some View {
        ListitemView()
    }
}
