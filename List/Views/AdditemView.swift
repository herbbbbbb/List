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
    @State private var selected: Int16 = 1
    
    var body: some View {
        Form{
           
            VStack{
                TextField("Item name", text: $name)

            }
            HStack{
                Image(systemName: mark(Color: 1))
                    .onTapGesture {
                        selected = 1
                    }
                    .foregroundColor(.red)
                    .imageScale(.large)
                
                Image(systemName: mark(Color: 2))
                    .onTapGesture {
                        selected = 2
                    }
                    .foregroundColor(.blue)
                    .imageScale(.large)

                Image(systemName: mark(Color: 3))
                    .onTapGesture {
                        selected = 3
                    }
                    .foregroundColor(.green)
                    .imageScale(.large)

                Image(systemName: mark(Color: 4))
                    .onTapGesture {
                        selected = 4
                    }
                    .foregroundColor(.yellow)
                    .imageScale(.large)

            }
            HStack{

                Button("Submit"){
                    DataController().addItem(name: name, mycolor: selected, context: manageObjContext)
                    dismiss()
                }
                //Spacer()
            }
                
                
             
            
        }
    }
    private func mark(Color: Int) -> String{
        var mark : String = "circle"
        
        if (Color==selected)
        {
            mark = "circle.fill"
        }
        else
        {
            mark = "circle"
        }
    
        
        return mark
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
