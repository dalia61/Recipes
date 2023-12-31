//
//  LoginCoordinator.swift
//  Recipes
//
//  Created by Dalia on 11/08/2023.
//

// LoginCoordinator.swift

import Foundation
import UIKit

protocol LoginCoordinatorProtocol: AnyObject {
    func navigateToRecipesList()
}

final class LoginCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginViewController = LoginViewController()
        let loginViewModel = LoginViewModel(coordinator: self)
        loginViewController.coordinator = self
        loginViewController.loginViewModel = loginViewModel
        navigationController.navigationBar.tintColor = .black
        navigationController.pushViewController(loginViewController, animated: true)
    }
}

extension LoginCoordinator: LoginCoordinatorProtocol {
    func navigateToRecipesList() {
        let recipesListCoordinator = RecipesListCoordinator(navigationController: navigationController)
        recipesListCoordinator.start()
    }
}
