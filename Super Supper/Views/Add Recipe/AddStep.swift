//
//  AddStep.swift
//  Super Supper
//
//  Created by Andrew Shields on 11/7/21.
//

import SwiftUI

struct AddStep: View {
    
    @State var step: String = ""
    let action: (String) -> Void
    
    var body: some View {
        Form {
            TextField("Recipe Instruction", text: $step)
            Button(action: {
                action(step)
            }) {
                Text("Add Step")
            }
        }
    }
}

struct AddStep_Previews: PreviewProvider {
    static var previews: some View {
        AddStep() { s1 in
            return
        }
    }
}
