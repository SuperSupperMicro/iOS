//
//  AddInventoryItem.swift
//  Super Supper
//
//  Created by Andrew Shields on 3/7/23.
//

import SwiftUI

struct AddInventoryItem: View {
    @Binding var item: InventoryItem
    
    var body: some View {
        Form {
            TextField("Name", text: $item.name)
            TextField("Description", text: $item.description)
            TextField("FDC ID", text: $item.fdcId)
        }
    }
}

struct AddInventoryItem_Previews: PreviewProvider {
    static var previews: some View {
        AddInventoryItem(item: .constant(InventoryItem(inventoryItemId: 0, name: "Test", description: "Testing123", fdcId: "123456")))
    }
}
