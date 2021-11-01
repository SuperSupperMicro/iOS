//
//  Step.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/29/21.
//

import SwiftUI

struct Step: View {
    var body: some View {
        HStack {
//            Text("#)")
//                .font(.footnote)
            Text("Remove the beef from the pot and add the vinegar and wine. Cook over medium-high heat, scraping the pan with a wooden spoon to loosen any browned bits. Add the beef, beef broth and bay leaves. Bring to a boil, then reduce to a slow simmer.")
                .font(.footnote)
                .padding()
        }
    }
}

struct Step_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Step()
            Step()
        }.previewLayout(.fixed(width: 300, height: 160))
    }
}
