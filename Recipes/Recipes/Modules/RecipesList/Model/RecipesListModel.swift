//
//  RecipesListModel.swift
//  Recipes
//
//  Created by Dalia on 11/08/2023.
//

import Foundation
typealias Recipes = [Recipe]
struct Recipe: Codable {
    let recipeID, fats, name, time: String?
    let image: String?
    let weeks: [String]?
    let carbos, fibers: String?
    let rating: Double?
    let country: String?
    let ratings: Int?
    let calories, headline: String?
    let keywords, products: [String]?
    let proteins: String?
    let favorites, difficulty: Int?
    let recipeDescription: String?
    let highlighted: Bool?
    let ingredients: [String]?
    let incompatibilities: [String]?
    let deliverableIngredients: [String]?
    let undeliverableIngredients: [String]?
    var isFavourited: Bool?
    enum CodingKeys: String, CodingKey {
        case fats, name, time, image, weeks, carbos, fibers, rating, country, ratings, calories, headline, keywords, products, proteins, favorites, difficulty, isFavourited
        case recipeID = "id"
        case recipeDescription = "description"
        case highlighted, ingredients, incompatibilities
        case deliverableIngredients = "deliverable_ingredients"
        case undeliverableIngredients = "undeliverable_ingredients"
    }
}
