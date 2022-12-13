//
//  ContentView.swift
//  List
//
//  Created by Herbert Lind Bjerre on 04/12/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var manageObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.state)]) var item:FetchedResults<MyItem>
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("Items not checked \(Int(totalItemNotCheked()))")
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                List{
                    ForEach(item){ item in
                        HStack{
                            Image(systemName: item.state ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    item.state = !item.state
                                    DataController().save(context: manageObjContext)
                                }
                            Text(item.name!)
                        }
                    }
                    .onDelete(perform: deleteItem)
                }
            }
            .navigationTitle("List")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink("Add") {
                        AddItemView()
                            .navigationTitle("Add Item")
                    }
                }
            }
        }
    }
    private func deleteItem(offsets: IndexSet){
        withAnimation{
            offsets.map{item[$0]}.forEach(manageObjContext.delete)
            DataController().save(context: manageObjContext)
        }
    }
    
    private func totalItemNotCheked() -> Double{
        return 0.0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

