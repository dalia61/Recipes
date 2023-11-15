//
//  RecipesDetailsCoordinator.swift
//  Recipes
//
//  Created by Dalia on 11/08/2023.
//

import Foundation
import UIKit
protocol RecipesDetailsCoordinatorProtocol: AnyObject {
}
class RecipesDetailsCoordinator: Coordinator {
    let navigationController: UINavigationController
    let recipe: String
    init(navigationController: UINavigationController, recipe: String) {
        self.navigationController = navigationController
        self.recipe = recipe
    }
    func start() {
    }
}
extension RecipesDetailsCoordinator: RecipesDetailsCoordinatorProtocol {
}
