//
//  Super_SupperApp.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/21/21.
//

import SwiftUI

@main
struct Super_SupperApp: App {
    @StateObject private var recipeController = RecipeController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeController)
        }
    }
}
