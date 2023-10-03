//
//  Recipe.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/23/21.
//

import SwiftUI

struct RecipeDeatil: View {
    
    @EnvironmentObject var recipeController: RecipeController
    var id: Int
    
    @State private var showIngredients = false
    
    var body: some View {
        Text("RecipeDetail")
//        ScrollView {
//            Group {
//                Spacer()
//                if #available(iOS 15.0, *) {
//                    AsyncImage(url: URL(string: recipeController.recipe.imgUrl))
//                        .frame(width: 275, height: 275)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                        .shadow(radius: 4)
//                } else {
//                    Image("BeefStew")
//                        .frame(width: 275, height: 275)
//                        .clipShape(Circle())
//                    .overlay(Circle().stroke(Color.gray, lineWidth: 10))
//                }
//                Text(recipeController.recipe.title)
//                    .font(.title)
//                TimeInfo(totalTime: recipeController.recipe.totalTime,
//                     prepTime: recipeController.recipe.prepTime,
//                     cookTime: recipeController.recipe.cookTime,
//                     yields: recipeController.recipe.yields,
//                     feeds: recipeController.recipe.feeds)
//                Divider()
//            }
//
//            Group {
//                Text("Description:")
//                    .font(.headline)
//                .multilineTextAlignment(.center)
//
//                Text(recipeController.recipe.description)
//                    .font(.footnote)
//
//                Divider()
//            }
//
//            Group {
////                IngredientList(recipe: recipeController.recipe)
////                    .frame(minHeight: 300)
////
//                Button(action: { showIngredients.toggle() }) {
//                    Text("Ingredients")
//                }
//                .padding()
//                .background(Color.orange)
//
//                Divider()
//
//                StepList(recipe: recipeController.recipe)
//                .frame(minHeight: 200)
//            }
//        }
//        .navigationTitle(recipeController.recipe.title)
//        .navigationBarTitleDisplayMode(.inline)
//        .padding()
//        .onAppear{
//            recipeController.getRecipe(id)
//        }
//        .sheet(isPresented: $showIngredients) {
//            IngredientList(recipe: recipeController.recipe)
//                .frame(minHeight: 300)
//        }
    }
}

struct Recipe_Previews: PreviewProvider {
    static let recipeControllers = RecipeController()
    
    static var previews: some View {
        return RecipeDeatil(id: 1)
            .environmentObject(recipeControllers)
    }
}
