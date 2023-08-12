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
}
protocol LoginOutputProtocol: AnyObject {
    func configureButtonEnabled(onEnabled: Bool)
    func handelFieldState(error: String?)
}
final class LoginViewModel: LoginInputProtocol{
    private var email: String = ""
    private var password: String = ""
    private var onButtonEnabled: Bool = false
    private let coordinator: LoginCoordinatorProtocol
    private weak var viewModelOutput: LoginOutputProtocol?
    init(coordinator: LoginCoordinatorProtocol, viewModelOutput: LoginOutputProtocol ) {
        self.coordinator = coordinator
        self.viewModelOutput = viewModelOutput
    }
}
extension LoginViewModel{
    func validateEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func validatePassword(password: String) -> Bool {
        if !password.isEmpty {
            return true
        } else {
            return false
        }
    }
    func updateEmail(_ text: String) {
        email = text
        validateEmail(email: email)
        updateEnabledStateButton()
    }
    func updatePassword(_ text: String) {
        password = text
        validatePassword(password: password)
        updateEnabledStateButton()
    }
}
private extension LoginViewModel {
    func updateEnabledStateButton() {
        let isEmailValid = validateEmail(email: email)
        let isPasswordValid = validatePassword(password: password)
        let isButtonEnabled = isEmailValid && isPasswordValid
        onButtonEnabled = isButtonEnabled
        viewModelOutput?.configureButtonEnabled(onEnabled: onButtonEnabled)
    }
}
