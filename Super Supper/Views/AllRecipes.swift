//
//  AllRecipes.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/31/21.
//

import SwiftUI

struct AllRecipes: View {
    @EnvironmentObject var recipeController: RecipeController
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recipeController.recipes) { recipe in
                    NavigationLink(destination: RecipeDeatil(recipe: recipe)) {
                        RecipeRow(recipe: recipe)
                    }
                }
            }
            .navigationTitle("All Recipes")
        }
    }
}

struct AllRecipes_Previews: PreviewProvider {
    static var previews: some View {
        AllRecipes()
            .environmentObject(RecipeController())
    }
}
