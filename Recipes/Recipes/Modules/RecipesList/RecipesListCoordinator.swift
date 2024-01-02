//
//  RecipesListCoordinator.swift
//  Recipes
//
//  Created by Dalia on 11/08/2023.
//

import Foundation
import UIKit

class RecipesListCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let recipesViewController = RecipesViewController()
        let recipesListViewModel = RecipesListViewModel()
        recipesViewController.viewModel = recipesListViewModel
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.topItem?.title = "Recipes"
        navigationController.pushViewController(recipesViewController, animated: true)
    }
}
