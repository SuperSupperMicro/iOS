//
//  MainCategory.swift
//  Super Supper
//
//  Created by Andrew Shields on 11/1/21.
//

import SwiftUI

struct MainCategory: View {
    @EnvironmentObject var recipeController: RecipeController
    let action: () -> Void
    let label: String
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .fontWeight(.regular)
                .foregroundColor(Color.black)
                .padding()
        }.padding()
            .frame(width: /*@START_MENU_TOKEN@*/308.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            .border(Color.black)
    }
}

struct MainCategory_Previews: PreviewProvider {
    static let recipeController = RecipeController()
    
    static var previews: some View {
        MainCategory(action: recipeController.getAllRecipes, label: "Get All Recipes")
            .environmentObject(recipeController)
    }
}
