//
//  ContentView.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/21/21.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct ContentView: View {
    @EnvironmentObject var recipeController: RecipeController
    @EnvironmentObject var itemVM: InventoryItemViewModel
    @EnvironmentObject var authVM: AuthenticationViewModel

    @State private var tabSelection: Tab = .mealPlans

    enum Tab {
        case shoppingList
        case invetoryItems
        case mealPlans
        case recipes
    }
    
    var body: some View {
        NavigationView {
            switch authVM.signInState {
            case .signedOut:
                Login()
                    .navigationTitle("Login")
            case .signedIn:
                TabView(selection: $tabSelection) {
                    Text("ShoppingList")
                        .tabItem {
                            Label("Shopping List", systemImage: "circle")
                        }
                        .tag(Tab.shoppingList)
                    
                    VStack {
//                        inventoryItemList
                        InventoryMain()
                        Button("SHOW ME") {
                            print("clicking")
                            showAddItem.toggle()
                        }
                        Button("Test AUTH!") {
                            authVM.testSend()
                        }
                        Button("Sign Out") {
                            authVM.signOut()
                        }
                    }
                    .tabItem {
                        Label("Inventory Items", systemImage: "list.bullet")
                    }
                    .tag(Tab.invetoryItems)
                    
                    Text("Meal Plans")
                        .tabItem {
                            Label("Meal Plans", systemImage: "circle")
                        }
                        .tag(Tab.mealPlans)
                    
                    
                    AllRecipes()
                        .tabItem {
                            Label("Recipes", systemImage: "list.bullet")
                        }
                        .tag(Tab.recipes)
                }
            }
        }
        
        
    }
    
    @State private var currentItem: InventoryItem = InventoryItem.DEFAULTTHEME
    @State var showAddItem = false
    
    private var inventoryItemList: some View {
        InventoryItemList()
            .sheet(isPresented: $showAddItem) {
                VStack {
                    AddInventoryItem()
                    Button("Submit") {
                        Task {
                           await itemSubmissionHandler()
                        }
                    }
                }
                .onSubmit {
                    Task {
                        await itemSubmissionHandler()
                    }
                }
            }
    }
    
    private func itemSubmissionHandler() async {
        if !currentItem.name.isEmpty, !currentItem.description.isEmpty {
            itemVM.postNewInvItem(item: currentItem)
        }
        
        /// Dekay relead of items for 1 second, sllowing time for POST req to complete
        try? await Task.sleep(until: .now + .seconds(1), clock: .continuous)
        itemVM.fetchAllItems()
        showAddItem = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeController())
            .environmentObject(AuthenticationViewModel())
    }
}

