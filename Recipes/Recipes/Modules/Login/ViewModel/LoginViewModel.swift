//
//  LoginViewModel.swift
//  Recipes
//
//  Created by Dalia on 10/08/2023.
//

import Foundation
protocol LoginInputProtocol: AnyObject {
    func updateEmail(_ text: String)
    func updatePassword(_ text: String)
    func login(email: String, password: String)
}
protocol LoginOutputProtocol: AnyObject {
    func configureButtonEnabled(onEnabled: Bool)
    func handelFieldState(error: String?)
}
class LoginViewModel{
    private var email: String = ""
    private var password: String = ""
    private var onButtonEnabled: Bool = false
    private let coordinator: LoginCoordinatorProtocol
    private weak var viewModelOutput: LoginOutputProtocol?
    init(coordinator: LoginCoordinatorProtocol, viewModelOutput: LoginOutputProtocol) {
        self.coordinator = coordinator
        self.viewModelOutput = viewModelOutput
    }
    func login(email: String, password: String) {
        if email.isEmpty || password.isEmpty {
            viewModelOutput?.handelFieldState(error: "Email and Password couldn't be empty")
        } else {
            let isEmailValid = validateEmail(email: email)
            let isPasswordValid = validatePassword(password: password)
            if isEmailValid && isPasswordValid {
                coordinator.navigateToRecipesList()
            } else {
                viewModelOutput?.handelFieldState(error: "Wrong Email or Password")
            }
        }
    }
    func updateEmail(_ text: String) {
        email = text
        updateEnabledStateButton()
    }
    func updatePassword(_ text: String) {
        password = text
        updateEnabledStateButton()
    }
    func updateEnabledStateButton() {
        let isEmailValid = validateEmail(email: email)
        let isPasswordValid = validatePassword(password: password)
        let isButtonEnabled = isEmailValid && isPasswordValid
        onButtonEnabled = isButtonEnabled
        viewModelOutput?.configureButtonEnabled(onEnabled: onButtonEnabled)
    }
    func validateEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func validatePassword(password: String) -> Bool {
        return !password.isEmpty
    }
}
