//
//  Addingredient.swift
//  Super Supper
//
//  Created by Andrew Shields on 11/7/21.
//

import SwiftUI

struct Addingredient: View {
    
    @State var qty: String = ""
    @State var ingredient: String = ""
    var action: (String, String) -> Void
    
    var body: some View {
        Form {
            TextField("Quantity", text: $qty)
            TextField("Ingredient", text: $ingredient)
            Button(action: {
                action(qty, ingredient)
            }) {
                Text("Add Ingredient")
            }
        }
    }
}

struct Addingredient_Previews: PreviewProvider {
    static var previews: some View {
        Addingredient() { s1, s2 in
            return
        }
    }
}
