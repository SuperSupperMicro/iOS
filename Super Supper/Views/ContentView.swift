//
//  ContentView.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/21/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var recipeController: RecipeController
    
    let categories = [
        "Get All Recipes",
        "My Recipes",
        "By Tag",
        "By Inventory",
        "By Time"
    ]
    
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: AllRecipes()) { MainCategory(label: categories[0]) }
                
                NavigationLink(destination: AllRecipes()) { MainCategory(label: categories[1]) }
                
                NavigationLink(destination: AllRecipes()) { MainCategory(label: categories[2]) }
                
                NavigationLink(destination: AllRecipes()) { MainCategory(label: categories[3]) }
                
                NavigationLink(destination: AllRecipes()) { MainCategory(label: categories[4]) }
            }
//            .navigationTitle("Super Supper")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeController())
    }
}
