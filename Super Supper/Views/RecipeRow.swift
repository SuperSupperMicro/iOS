//
//  RecipeRow.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/22/21.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: RecipeSummary
    
    var body: some View {
        HStack {
            if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: recipe.imgUrl))
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
            } else {
                Image("beefStew")
            }
            Text(recipe.title)
                .font(.title)
        }
        .padding()
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var recipes = RecipeController().recipes
    static var previews: some View {
        RecipeRow(recipe: recipes[0])
    }
}
