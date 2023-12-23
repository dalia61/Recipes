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
    var isFavourite: Bool?
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
    init(recipe: Recipe) {
        self.name = recipe.name
        self.recipeDescription = recipe.recipeDescription
        self.image = recipe.image
        self.isFavourite = recipe.isFavourited
    }
}
