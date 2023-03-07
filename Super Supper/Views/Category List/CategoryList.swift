//
//  CategoryList.swift
//  Super Supper
//
//  Created by Andrew Shields on 11/11/21.
//

import SwiftUI

struct CategoryList: View {
    
    let categories = [
        "Get All Recipes",
        "My Recipes",
        "By Tag",
        "By Inventory",
        "By Time"
    ]
    
    var body: some View {
        VStack {
            Text("Categories")
                .padding(.top, -10.0)
                .font(.title)
            NavigationLink(destination: AllRecipes()) { MainCategory(label: categories[0]) }
            
            NavigationLink(destination: AllRecipes()) { MainCategory(label: categories[1]) }
            
            NavigationLink(destination: AllRecipes()) { MainCategory(label: categories[2]) }
            
            NavigationLink(destination: AllRecipes()) { MainCategory(label: categories[3]) }
            
            NavigationLink(destination: AllRecipes()) { MainCategory(label: categories[4]) }
            
            NavigationLink(destination: AddRecipe()) { MainCategory(label: "add new recipe") }
        }
        .padding()
    }
}

struct CategoryList_Previews: PreviewProvider {
    static var previews: some View {
        CategoryList()
    }
}
