//
//  Super_SupperApp.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/21/21.
//

import SwiftUI
//import GoogleSignIn

@main
struct Super_SupperApp: App {
    @StateObject private var recipeController = RecipeController()
    @StateObject private var itemVM = InventoryItemViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeController)
                .environmentObject(itemVM)
            /// Google Sign in 
//                .onOpenURL{ url in
//                    GIDSignIn.sharedInstance.handle(url)
//                }
//                .onAppear{
//                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
//                        // check if user exist othersie do someting with error
//                    }
//                }
        }
    }
}
