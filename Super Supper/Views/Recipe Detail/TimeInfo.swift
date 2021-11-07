//
//  Time.swift
//  Super Supper
//
//  Created by Andrew Shields on 11/7/21.
//

import SwiftUI

struct TimeInfo: View {
    
    let totalTime: String
    let prepTime: String
    let cookTime: String
    let yields: String
    let feeds: String
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Total Time")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text(totalTime)
                }
                Text("/")
                VStack {
                    Text("Prep Time")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text(prepTime)
                }
                Text("/")
                VStack {
                    Text("Cook Time")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text(cookTime)
                }
            }.font(.caption2)
            
            HStack {
                VStack {
                    Text("Yeilds")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text(yields)
                }
                Text("/")
                VStack {
                    Text("Feeds")
                        .font(.footnote)
                        .fontWeight(.bold)
                    Text(feeds)
                }
            }
            .font(.caption2)
        }
        .padding()
    }
}

struct Time_Previews: PreviewProvider {
    static var previews: some View {
        TimeInfo(totalTime: "2 hours",
             prepTime: "30 min",
             cookTime: "1 hour 30 minutes",
             yields: "2 qts",
             feeds: "4")
    }
}
