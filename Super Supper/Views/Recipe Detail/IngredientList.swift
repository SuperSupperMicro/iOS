//
//  IngredientList.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/23/21.
//

import SwiftUI

struct IngredientList: View {
    var recipe: Recipe
    
    var body: some View {
        VStack {
            HStack {
                Text("Ingredients:")
                    .font(.headline)
                Spacer()
            }
            List {
                ForEach(recipe.ingredients) { ingredient in
                    RecipeIngredient(qty: ingredient.qty, ingredient: ingredient.ingredient)
                }
            }
        }
    }
}

struct IngredientList_Previews: PreviewProvider {
    static let rec = RecipeController().defaultRecipe
    static var previews: some View {
        IngredientList(recipe: rec)
            
    }
}
