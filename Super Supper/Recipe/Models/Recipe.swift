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
}

struct RecipePost: Hashable, Codable {
    
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
}

struct Step: Hashable, Codable, Identifiable {
    var stepNum: Int
    var step: String
    var id: Int {
        stepNum
    }
}

struct Ingredient: Hashable, Codable, Identifiable {
    var qty: String
    var ingredient: String
    var id: String {
        qty + ingredient
    }
}

struct Tag: Hashable, Codable {
    var recipetagId: Int
    var tagId: Int
}
