//
//  MainCategory.swift
//  Super Supper
//
//  Created by Andrew Shields on 11/1/21.
//

import SwiftUI

struct MainCategory: View {
    @EnvironmentObject var recipeController: RecipeController
    let label: String
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 200, height: 125)
                Text(label)
                    .fontWeight(.regular)
                    .foregroundColor(Color.blue)
                .padding()
            }
                
        }.padding()
            .frame(width: 250.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            .border(Color.black)
            .cornerRadius(1.0, antialiased: false)
    }
}

struct MainCategory_Previews: PreviewProvider {
    static let recipeController = RecipeController()
    
    static var previews: some View {
        MainCategory(label: "Get All Recipes")
            .environmentObject(recipeController)
    }
}
