//
//  IngredientList.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/23/21.
//

import SwiftUI

struct IngredientList: View {
    var body: some View {
        VStack {
            HStack {
                Text("Ingredients:")
                    .font(.headline)
                Spacer()
            }
            List {
                HStack {
                    Circle()
                        .frame(width: 5, height: 5)
                    Text("1/4 cup")
                    Spacer()
                    Text("sugar")
                }
                HStack {
                    Circle()
                        .frame(width: 5, height: 5)
                    Text("1/2 cup")
                    Spacer()
                    Text("all-purpose flour")
                }
                HStack {
                    Circle()
                        .frame(width: 5, height: 5)
                    Text("1/4 tsp")
                    Spacer()
                    Text("vanilla extract")
                }
                HStack {
                    Circle()
                        .frame(width: 5, height: 5)
                    Text("1/4 cup")
                    Spacer()
                    Text("unsalted butter")
                }
            }
        }
    }
}

struct IngredientList_Previews: PreviewProvider {
    static var previews: some View {
        IngredientList()
    }
}
