//
//  ContentView.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/21/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var recipeController: RecipeController
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: AllRecipes()) { MainCategory() }
            }
        }
        .navigationTitle("Super Supper")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeController())
    }
}
