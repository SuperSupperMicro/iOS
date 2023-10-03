//
//  InventoryItemList.swift
//  Super Supper
//
//  Created by Andrew Shields on 3/10/23.
//

import SwiftUI

struct InventoryItemList: View {
    @EnvironmentObject var itemVM: InventoryItemViewModel
    
    var body: some View {
        Group {
            if (itemVM.inventoryItems != nil) {
                List {
                    ForEach(itemVM.inventoryItems!) { item in
                        Text(item.name)
                    }
                }
            } else {
                VStack {
                    ProgressView()
                    Text("Loading")
                }
            }
        }
        .onAppear{
            itemVM.fetchAllItems()
        }
    }
}

//struct InventoryItemList_Previews: PreviewProvider {
//    static var previews: some View {
//        InventoryItemList()
//    }
//}
