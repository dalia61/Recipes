//
//  OnboardingCoordinator.swift
//  Recipes
//
//  Created by Dalia on 11/08/2023.
//

import Foundation
import UIKit

protocol OnboardingCoordinatorProtocol: AnyObject {
    func navigateToLogin()
}

final class OnboardingCoordinator: Coordinator {
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let onBoardingViewModel = OnboardingViewModel(coordinator: self)
        let onBoardingViewControoler = OnboardingViewController()
        //navigationController.navigationBar.isHidden = true
        navigationController.setViewControllers([onBoardingViewControoler], animated: false) //true
    }
}

extension OnboardingCoordinator: OnboardingCoordinatorProtocol {
    func navigateToLogin() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.start()
    }
}
