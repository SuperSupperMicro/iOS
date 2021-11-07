//
//  Recipe.swift
//  Super Supper
//
//  Created by Andrew Shields on 10/29/21.
//

import Foundation

struct Recipe: Hashable, Codable, Identifiable {
    
    var id: Int
    var title: String
    var description: String
    var url: String
    var imgUrl: String
    var totalTime: String
    var prepTime: String
    var cookTime: String
    var yields: String
    var feeds: String
    var ingredients: [Ingredient]
    var steps: [Step]
    var tags: [Tag]
    
//    var id: Int {
//        recipeId
//    }
    
    struct Step: Hashable, Codable {
        var stepNum: Int
        var step: String
    }

    struct Ingredient: Hashable, Codable {
        var qty: String
        var ingredient: String
    }

    struct Tag: Hashable, Codable {
        var recipetagId: Int
        var tagId: Int
    }
}

