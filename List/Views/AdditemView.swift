//
//  ListitemView.swift
//  ItemList
//
//  Created by U. Lind Mortensen on 03/12/2022.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.managedObjectContext) var manageObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var color: Int16 = 0
    
    var body: some View {
        Form{
            Section{
                VStack{
                    TextField("Item name", text: $name)

                }
                HStack{
                    Image(systemName: "circle")
                    Image(systemName: "circle")
                    Image(systemName: "circle")
                }
                HStack{
                    //Spacer()
                    Button("Submit"){
                        DataController().addItem(name: name, context: manageObjContext)
                        dismiss()
                    }
                    //Spacer()
                }
                
                
             
            }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
