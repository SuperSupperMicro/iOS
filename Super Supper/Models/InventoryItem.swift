//
//  InventoryItem.swift
//  Super Supper
//
//  Created by Andrew Shields on 3/7/23.
//

import Foundation

struct InventoryItem: Hashable, Codable {
    var inventoryItemId: Int
    var name: String
    var description: String
    var fdcId: String
}

extension InventoryItem: Identifiable {
    var id: Int {
        inventoryItemId
    }
}

extension InventoryItem {
    static let DEFAULTTHEME = InventoryItem(inventoryItemId: 0, name: "", description: "", fdcId: "")
}
