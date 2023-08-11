//
//  LoginCoordinator.swift
//  Recipes
//
//  Created by Dalia on 11/08/2023.
//

import Foundation
import UIKit
protocol LoginCoordinatorProtocol: AnyObject {
}
final class LoginCoordinator: Coordinator {
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
    }
}
extension LoginCoordinator: LoginCoordinatorProtocol {
}
