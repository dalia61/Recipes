//
//  RecipesListCoordinator.swift
//  Recipes
//
//  Created by Dalia on 11/08/2023.
//

import Foundation
import UIKit
protocol RecipesListCoordinatorProtocol: AnyObject {
    func navigateToRecipesDetails(with recipe: Recipe)
}
class RecipesListCoordinator: Coordinator {
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let recipesViewController = RecipesViewController()
        let recipesListViewModel = RecipesListViewModel(coordinator: self)
        recipesViewController.viewModel = recipesListViewModel
        navigationController.pushViewController(recipesViewController, animated: true)
    }
}
extension RecipesListCoordinator: RecipesListCoordinatorProtocol {
    func navigateToRecipesDetails(with recipe: Recipe) {
    }
}
