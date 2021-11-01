//
//  Recipe.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/29/21.
//

import Foundation

struct Recipe: Hashable, Codable, Identifiable {
    
    let id: Int
    var title: String
    var description: String
    var url: String
    var imgUrl: String
    var totalTime: String
    var prepTime: String
    var cooktime: String
    var yields: String
    var feeds: String
    var ingredients: [Ingredient] = []
    var steps: [Step] = []
    var tags: [Tag] = []
    
    
    struct Step: Hashable, Codable {
        var stepNum: Int
        var step: String
    }

    struct Ingredient: Hashable, Codable {
        var qty: String
        var ingredient: String
    }

    struct Tag: Hashable, Codable {
        var recipeTagID: Int
        var tagID: String
    }
}

struct Wrapper:Hashable, Codable {
    let object: String
    let hasMore: Bool
    let data: [Recipe]
}


