//
//  RecipeCellViewModel.swift
//  Recipes
//
//  Created by Dalia on 13/08/2023.
//

import Foundation

class RecipeCellViewModel  {
    
    var name: String?
    var recipeDescription: String?
    var image: String?
    var isExpanded: Bool
    
    init(recipe: Recipe) {
        name = recipe.name
        recipeDescription = recipe.recipeDescription
        image = recipe.image
        isExpanded = recipe.isExpanded ?? false
    }
}

