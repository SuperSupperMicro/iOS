//
//  AddRecipe.swift
//  Super Supper
//
//  Created by Andrew Shields on 11/7/21.
//

import SwiftUI

struct AddRecipe: View {
    
    @EnvironmentObject var recipeController: RecipeController
    
    @State var title: String = ""
    @State var description: String = ""
    @State var url: String = ""
    @State var imgUrl: String = ""
    @State var totalTime: String = ""
    @State var prepTime: String = ""
    @State var cookTime: String = ""
    @State var yields: String = ""
    @State var feeds: String = ""
    @State var ingredients: [Ingredient] = []
    @State var steps: [Step] = []
    
    @State var showAddIngredient = false
    @State var showAddStep = false
    
    func addRecipeIngredient(_ qty: String,_ ing: String) -> Void {
        ingredients.append(Ingredient(qty: qty, ingredient: ing))
        showAddIngredient.toggle()
    }
    
    func addRecipeStep(_ instruction: String) -> Void {
        steps.append(Step(stepNum: 1 + steps.count, step: instruction))
        showAddStep.toggle()
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                TextField("URL", text: $url)
                TextField("Img URL", text: $imgUrl)
                TextField("Total Time", text: $totalTime)
                TextField("Prep Time", text: $prepTime)
                TextField("Cook Time", text: $cookTime)
                TextField("Total Yield", text: $yields)
                TextField("# of people recipe feeds", text: $feeds)
            }
            VStack {
                HStack {
                    Text("Ingredients")
                    Spacer()
                    Button(action: {
                        showAddIngredient.toggle()
                    }) {
                        Text("Add Ingredient")
                    }
                }
                ForEach(ingredients) { ingredient in
                    HStack {
                        Text(ingredient.qty)
                        Text(ingredient.ingredient)
                    }
                }
            }
            VStack {
                HStack {
                    Text("Instructions:")
                    Spacer()
                    Button(action: {
                        showAddStep.toggle()
                    }) {
                        Text("Add Step")
                    }
                }
                ForEach(steps) { step in
                    Text(step.step)
                }
            }
            .frame(minHeight: 100)
            
            Divider()
            
            NavigationLink(destination: AllRecipes()) {
                Button(action: { recipeController.postNewRecipe(title: title, description: description, url: url, imgUrl: imgUrl, totalTime: totalTime, prepTime: prepTime, cookTime: cookTime, yields: yields, feeds: feeds, ingredients: ingredients, steps: steps, tags: []) }) {
                    Text("Add Recipe")
                }
            }
            
            
        }
        .navigationTitle("New Recipe")
        .padding()
        .sheet(isPresented: $showAddIngredient) {
            Addingredient(action: addRecipeIngredient)
        }
        .sheet(isPresented: $showAddStep) {
            AddStep(action: addRecipeStep)
        }
    }
}

struct AddRecipe_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipe()
            .environmentObject(RecipeController())
    }
}
