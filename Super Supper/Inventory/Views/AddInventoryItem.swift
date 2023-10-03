//
//  AddInventoryItem.swift
//  Super Supper
//
//  Created by Andrew Shields on 3/7/23.
//

import SwiftUI

struct AddInventoryItem: View {
    @EnvironmentObject var invVM: InventoryItemViewModel
    @State var newGroceryItem: GroceryInventoryItem = GroceryInventoryItem(groceryItemId: 0, inDate: Date(), expDate: Date(), qty: "", availableQty: "", inventoryItem: InventoryItem(inventoryItemId: 0, name: "Add new Item", description: "", fdcId: ""))
    @State var searchString = ""
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                Form {
                    
                    
                    
                    
                    
                    
                    VStack {
                        HStack {
                            TextField("Search Items", text: $searchString)
                            Button("GO") {
    //                            dfdsf
                            }
                        }
                        
                        Text("OR")
                        Button("Add new Item") {
                            //
                        }
                        .buttonStyle(.automatic)
                    }
                    
                    
                    
                    if (invVM.searchItems != nil) {
                        ScrollView {
                            ForEach(invVM.searchItems!) { item in
                                Text(item.name)
                                    .padding(10)
                                    .frame(width: geometry.size.width * 0.80)
                                    .border(.black)
                                    .onTapGesture {
                                        newGroceryItem = GroceryInventoryItem(groceryItemId: 0, inDate: Date(), expDate: Date(), qty: "", availableQty: "", inventoryItem: item)
                                    }
                            }
                            
                        }
                    } else {
                        ProgressView()
                    }
                    
                    Text(newGroceryItem.name)
                    DatePicker("In Date", selection: $newGroceryItem.inDate)
                    DatePicker("Exp Date", selection: $newGroceryItem.expDate)
                    TextField("qty", text: $newGroceryItem.qty)
                    TextField("available qty", text: $newGroceryItem.availableQty)
                    
                    
                    
                    
                    
                }
                .onChange(of: searchString, perform: invVM.searchInv)
            }
        }
    }
}

struct AddInventoryItem_Previews: PreviewProvider {
    static var previews: some View {
        AddInventoryItem()
            .environmentObject(InventoryItemViewModel())
    }
}
