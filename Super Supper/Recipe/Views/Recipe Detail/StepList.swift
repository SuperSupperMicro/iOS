//
//  StepList.swift
//  Super Supper
//
//  Created by Andrew Shields on 11/7/21.
//

import SwiftUI

struct StepList: View {
    var recipe: Recipe
    
    @State private var completed = Set<Int>()
    
    var body: some View {
        VStack {
            Text("StepList")
//            HStack {
//                Text("Instructions:")
//                    .font(.headline)
//                Spacer()
//            }
//            ForEach(recipe.steps) { step in
//                RecipeStep(step: step.step)
//                Step(step: "Error loading recipe steps")
//            }
//            .navigationTitle("Instructions")
//            .toolbar { EditButton() }
//            .listStyle()
//            .frame(minHeight: 200)
        }
    }
}
//
//struct StepList_Previews: PreviewProvider {
//    static let rec = RecipeController().defaultRecipe
//    static var previews: some View {
//        StepList(recipe: rec)
//    }
//}
