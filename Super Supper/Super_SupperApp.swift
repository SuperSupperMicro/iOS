//
//  Super_SupperApp.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/21/21.
//

import SwiftUI
import GoogleSignIn

@main
struct Super_SupperApp: App {
    @StateObject private var recipeController = RecipeController()
    @StateObject private var itemVM = InventoryItemViewModel()
    @StateObject private var authVM = AuthenticationViewModel()
    @StateObject private var groceryVM = GroceryItemViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeController)
                .environmentObject(itemVM)
                .environmentObject(authVM)
                .environmentObject(groceryVM)
            /// Google Sign in 
                .onOpenURL{ url in
                    GIDSignIn.sharedInstance.handle(url)
                }
                .onAppear{
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        if let user = user {
                            self.authVM.signInState = .signedIn(user)
                        } else if let error = error {
                            self.authVM.signInState = .signedOut
                            print("Error restoring sign-in: \(error)")
                        } else {
                            self.authVM.signInState = .signedOut
                        }
                    }
                }
        }
    }
}
