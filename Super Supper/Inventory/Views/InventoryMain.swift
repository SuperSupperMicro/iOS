//
//  InventoryMain.swift
//  Super Supper
//
//  Created by Andrew Shields on 4/4/23.
//

import SwiftUI

struct InventoryMain: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.orange)
                        .frame(width: 200, height: 25)
                    Text("Search Bar")
                }
                
                Spacer()
                Divider()
                NavigationLink(destination: GroceryItemList()) {
//                    Label("Our Inventory", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
                    HStack {
                        Color.clear
                        ZStack {
                            Rectangle()
//                                .frame(width: 125, height: 125)
                            Text("Our Inventory")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(height: 125)
                }
                NavigationLink(destination: InventoryItemList()) {
//                    Label("Inventory Items", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
                    HStack {
                        ZStack {
                            Rectangle()
//                                .frame(width: 125, height: 125)
                            Text("Inventory Items")
                                .foregroundColor(.white)
                        }
                        Color.clear
                    }
                    .frame(height: 125)
                }
                NavigationLink(destination: InventoryItemList()) {
//                    Label("Inventory data", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
                    HStack {
                        Color.clear
                        ZStack {
                            Rectangle()
//                                .frame(width: 125, height: 125)
                            Text("Inventory Data")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(height: 125)
                }
                NavigationLink(destination: AddInventoryItem()) {
//                    Label("Add item to inventory", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
                    HStack {
                        ZStack {
                            Rectangle()
//                                .frame(width: 125, height: 125)
                            Text("Add Item to Inventory")
                                .foregroundColor(.white)
                        }
                        Color.clear
                    }
                    .frame(height: 125)
                }
            }
            .padding()
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("C1")/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .navigationTitle("InventoryMain")
        }
        
        
    }
}

struct InventoryMain_Previews: PreviewProvider {
    static var previews: some View {
        InventoryMain()
    }
}
