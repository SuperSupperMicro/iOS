//
//  ContentView.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/21/21.
//

import SwiftUI
//import GoogleSignIn
//import GoogleSignInSwift

struct ContentView: View {
    @EnvironmentObject var recipeController: RecipeController
    @EnvironmentObject var itemVM: InventoryItemViewModel
//    @ObservedObject var vm = GoogleSignInButtonViewModel()
    
    @State private var tabSelection: Tab = .recipes
    
    enum Tab {
        case recipes
        case invetoryItems
        case tab2
    }
    
    var body: some View {
        TabView(selection: $tabSelection) {
            VStack {
                inventoryItemList
                Button("Add Item") {
                    showAddItem.toggle()
                }
                /// Google Sign in button
//                GoogleSignInButton(viewModel: vm, action: handleSignInButton )
            }
            .tabItem {
                Label("InventoryItems", systemImage: "list.bullet")
            }
            
            AllRecipes()
                .tabItem {
                    Label("Recipes", systemImage: "list.bullet")
                }


            CategoryList()
                .tabItem {
                    Label("Tab2", systemImage: "star")
                }
        }
    }
    
    @State private var currentItem: InventoryItem = InventoryItem.DEFAULTTHEME
    @State var showAddItem = false
    
    private var inventoryItemList: some View {
        InventoryItemList()
            .sheet(isPresented: $showAddItem) {
                VStack {
                    AddInventoryItem(item: $currentItem)
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
    
    /// Sign in handler for Google sign in
//    func handleSignInButton() {
//        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
//            print("There is no root view controller!")
//            return
//          }
//        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
//            guard let result = signInResult else {
//                // Inspect error
//                return
//            }
//
//            // if sign-in succeeded, display the app's main content view
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipeController())
    }
}
