//
//  StepList.swift
//  Super Supper
//
//  Created by Andrew Shields on 11/7/21.
//

import SwiftUI

struct StepList: View {
    var recipe: Recipe
    
    var body: some View {
        VStack {
            HStack {
                Text("Instructions:")
                    .font(.headline)
                Spacer()
            }
            List {
                ForEach(recipe.steps) { step in
                    RecipeStep(step: step.step)
                }
//                Step(step: "Error loading recipe steps")
            }
//            .frame(minHeight: 200)
        }
    }
}

struct StepList_Previews: PreviewProvider {
    static let rec = RecipeController().defaultRecipe
    static var previews: some View {
        StepList(recipe: rec)
    }
}
