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
            VStack {
                List {
                    ForEach(recipeController.recipes) { recipe in
                        NavigationLink(destination: RecipeDeatil(id: recipe.id)) {
                            RecipeRow(recipe: recipe)
                        }
                    }
                }
                .navigationTitle("All Recipes")
//                .onAppear(perform: recipeController.getAllRecipes)
            }
//            .onAppear {
//                recipeController.getAllRecipes()
//            }
        }
    }
}

struct AllRecipes_Previews: PreviewProvider {
    static var previews: some View {
        AllRecipes()
            .environmentObject(RecipeController())
    }
}
