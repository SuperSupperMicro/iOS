//
//  Recipe.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/23/21.
//

import SwiftUI

struct RecipeDeatil: View {
    @EnvironmentObject var recipeController: RecipeController
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            Group {
                Spacer()
                Image("BeefStew")
                    .frame(width: 275, height: 275)
                    .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 10))
                
                Text(recipe.title)
                    .font(.title)
                VStack {
                    HStack {
                        VStack {
                            Text("Total Time")
                                .font(.footnote)
                                .fontWeight(.bold)
                            Text(recipe.totalTime)
                        }
                        Text("/")
                        VStack {
                            Text("Prep Time")
                                .font(.footnote)
                                .fontWeight(.bold)
                            Text(recipe.prepTime)
                        }
                        Text("/")
                        VStack {
                            Text("Cook Time")
                                .font(.footnote)
                                .fontWeight(.bold)
                            Text(recipe.cookTime)
                        }
                    }.font(.caption2)
                    
                    HStack {
                        VStack {
                            Text("Yeilds")
                                .font(.footnote)
                                .fontWeight(.bold)
                            Text(recipe.yields)
                        }
                        Text("/")
                        VStack {
                            Text("Feeds")
                                .font(.footnote)
                                .fontWeight(.bold)
                            Text(recipe.feeds)
                        }
                    }
                    .font(.caption2)
                }
                .padding()
                Divider()
            }
            
            
            Group {
                Text("Description:")
                    .font(.headline)
                .multilineTextAlignment(.center)
                
                Text(recipe.description)
                    .font(.footnote)
                
                Divider()
                
            }
                
            
            
            IngredientList()
                .frame(minHeight: 300)
            
            Divider()
            
            HStack {
                Text("Instructions:")
                    .font(.headline)
                Spacer()
            }
            List {
                Step(step: "Error loading recipe steps")

            }
            .frame(minHeight: 200)
        }
        .padding()
    }
}

struct Recipe_Previews: PreviewProvider {
    static let recipeControllers = RecipeController()
    
    static var previews: some View {
        return RecipeDeatil(recipe: recipeControllers.defaultRecipe)
            .environmentObject(recipeControllers)
    }
}
