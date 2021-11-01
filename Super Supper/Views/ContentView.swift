//
//  ContentView.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/21/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        NavigationView {
//            List {
////                NavigationLink(destination: <#T##() -> _#>, label: <#T##() -> _#>)
//            }
//        }
//        .navigationTitle("Super Supper")
        
        AllRecipes()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeController())
    }
}
