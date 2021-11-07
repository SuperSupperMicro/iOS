//
//  Ingredient.swift
//  Super Supper
//
//  Created by Andrew Shields on 11/7/21.
//

import SwiftUI

struct RecipeIngredient: View {
    
    let qty: String
    let ingredient: String
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 5, height: 5)
            Text(qty)
            Spacer()
            Text(ingredient)
        }
    }
}

struct Ingredient_Previews: PreviewProvider {
    static var previews: some View {
        RecipeIngredient(qty: "1/4 cup", ingredient: "sugar")
    }
}
