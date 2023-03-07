//
//  AllRecipes.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/31/21.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct AllRecipes: View {
    @EnvironmentObject var recipeController: RecipeController
    @ObservedObject var vm = GoogleSignInButtonViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                GoogleSignInButton(viewModel: vm, action: handleSignInButton )
                
                List {
                    ForEach(recipeController.recipes) { recipe in
                        NavigationLink(destination: RecipeDeatil(id: recipe.id)) {
                            RecipeRow(recipe: recipe)
                        }
                    }
                }
                .navigationTitle("All Recipes")
            .onAppear(perform: recipeController.getAllRecipes)
            }
        }
    }
    
    func handleSignInButton() {
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            print("There is no root view controller!")
            return
          }
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
            guard let result = signInResult else {
                // Inspect error
                return
            }
            
            // if sign-in succeeded, display the app's main content view
        }
    }
}

struct AllRecipes_Previews: PreviewProvider {
    static var previews: some View {
        AllRecipes()
            .environmentObject(RecipeController())
    }
}
