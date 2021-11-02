//
//  MainCategory.swift
//  Super Supper
//
//  Created by Andrew Shields on 11/1/21.
//

import SwiftUI

struct MainCategory: View {
    @EnvironmentObject var recipeController: RecipeController
    var body: some View {
        Text("Main Category!!!!")
            .onAppear(perform: recipeController.getAllRecipes)
    }
}

struct MainCategory_Previews: PreviewProvider {
    static var previews: some View {
        MainCategory()
            .environmentObject(RecipeController())
    }
}
