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
                Spacer()
                Text("X")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
            }
            List(recipe.ingredients) {
//                ForEach(recipe.ingredients) { ingredient in
//                    RecipeIngredient(qty: ingredient.qty, ingredient: ingredient.ingredient)
//                }
                RecipeIngredient(qty: $0.qty, ingredient: $0.ingredient)
            }
        }
        .padding()
    }
}
//
//struct IngredientList_Previews: PreviewProvider {
//    static let rec = RecipeController().defaultRecipe
//    static var previews: some View {
//        IngredientList(recipe: rec)
//            
//    }
//}
