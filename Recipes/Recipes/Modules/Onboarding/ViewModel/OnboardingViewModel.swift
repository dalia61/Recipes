//
//  OnboardingViewModel.swift
//  Recipes
//
//  Created by Dalia on 11/08/2023.
//

import Foundation

protocol OnboardingViewProtocol: AnyObject {
    var viewModel: OnboardingViewModelProtocol! { get set }
}
protocol OnboardingViewModelProtocol: AnyObject {
    var view: OnboardingViewProtocol? { get set }
    func viewDidLoad()
}
class OnboardingViewModel{
    private let coordinator: OnboardingCoordinatorProtocol
    init(coordinator: OnboardingCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}
extension OnboardingViewModel {
    func getStarted() {
        coordinator.navigateToLogin()
    }
}
