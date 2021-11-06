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
                            Text("2 hr")
                        }
                        Text("/")
                        VStack {
                            Text("Prep Time")
                                .font(.footnote)
                                .fontWeight(.bold)
                            Text("30 min")
                        }
                        Text("/")
                        VStack {
                            Text("Cook Time")
                                .font(.footnote)
                                .fontWeight(.bold)
                            Text("1 1/2 hrs")
                        }
                    }.font(.caption2)
                    
                    HStack {
                        VStack {
                            Text("Yeilds")
                                .font(.footnote)
                                .fontWeight(.bold)
                            Text("3 qts")
                        }
                        Text("/")
                        VStack {
                            Text("Feeds")
                                .font(.footnote)
                                .fontWeight(.bold)
                            Text("4")
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
                
                Text("This classic stick-to-your-ribs stew is the ideal project for a chilly weekend. Beef, onion, carrots, potatoes and red wine come together in cozy harmony. If you are feeding a crowd, good news: It doubles (or triples) beautifully.")
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
                Step()
            }
            .frame(minHeight: 200)
        }
        .padding()
    }
}

struct Recipe_Previews: PreviewProvider {
    static let recipeControllers = RecipeController()
    
    static var previews: some View {
        return RecipeDeatil(recipe: recipeControllers.recipes[0])
            .environmentObject(recipeControllers)
    }
}
