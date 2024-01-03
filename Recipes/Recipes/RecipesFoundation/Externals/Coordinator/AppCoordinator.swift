//
//  AppCoordinator.swift
//  Recipes
//
//  Created by Dalia on 10/08/2023.
//

import Foundation
import UIKit
protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    func start()
}
final class AppCoordinator {
    private let window: UIWindow
    private var children: [Coordinator] = []
    private var isLoggedIn = false
    init(window: UIWindow) {
        self.window = window
    }
    func start() {
        displayOnboardingFlow()
    }
}

private extension AppCoordinator {
    func displayOnboardingFlow() {
        let navigationController = UINavigationController()
        let coordinator = OnboardingCoordinator(navigationController: navigationController) //RecipesListCoordinator(navigationController: navigationController)
        coordinator.start()
        children.append(coordinator)
        replaceRootViewController(navigationController)
    }
}
private extension AppCoordinator {
    func replaceRootViewController(_ viewController: UIViewController) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
