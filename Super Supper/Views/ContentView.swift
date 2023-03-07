//
//  ContentView.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/21/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var recipeController: RecipeController
    @State private var tabSelection: Tab = .recipes
    
    enum Tab {
        case recipes
        case tab2
    }
    
    var body: some View {
        TabView(selection: $tabSelection) {
            AllRecipes()
                .tabItem {
                    Label("Recipes", systemImage: "list.bullet")
                }
            
            
            CategoryList()
                .tabItem {
                    Label("Tab2", systemImage: "star")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeController())
    }
}
