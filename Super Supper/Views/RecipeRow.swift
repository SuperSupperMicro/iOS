//
//  RecipeRow.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/22/21.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: RecipeSummary
    
    var body: some View {
        HStack {
            Text("Recipe Photo")
            Text(recipe.title)
                .font(.title)
        }
        .padding()
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var recipes = RecipeController().recipes
    static var previews: some View {
        RecipeRow(recipe: recipes[0])
    }
}
