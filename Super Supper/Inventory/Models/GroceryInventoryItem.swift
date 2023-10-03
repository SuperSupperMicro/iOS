//
//  GroceryInventoryItem.swift
//  Super Supper
//
//  Created by Andrew Shields on 4/4/23.
//

import Foundation


struct GroceryInventoryItem: Hashable, Codable {
    var groceryItemId: Int
    var inDate: Date
    var expDate: Date
    var qty: String
    var availableQty: String
    var inventoryItem: InventoryItem
}

extension GroceryInventoryItem: Identifiable {
    var id: Int {
        groceryItemId
    }
    var name: String {
        inventoryItem.name
    }
}

extension GroceryInventoryItem {
    static var dateFormatter: DateFormatter {
        var d = DateFormatter()
        d.dateFormat = "yyyy-MM-dd"
        return d
    }
}
