//
//  RecipeSummary.swift
//  Super Supper
//
//  Created by Andrew Shields on 11/6/21.
//

import Foundation


struct RecipeSummary: Hashable, Codable, Identifiable {
    
    let recipeId: Int
    var title: String
    var description: String
    var url: String
    var imgUrl: String
    var totalTime: String
    var prepTime: String
    var cookTime: String
    var yields: String
    var feeds: String
    
    var id: Int {recipeId}
}

struct Wrapper:Hashable, Codable {
    let object: String
    let hasMore: Bool
    let data: [RecipeSummary]
}
