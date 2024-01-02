//
//  LoginViewModel.swift
//  Recipes
//
//  Created by Dalia on 10/08/2023.
//

import Foundation

class LoginViewModel{
    private var email: String = ""
    private var password: String = ""
    
    var isLoading: Observable<Bool> = Observable(false)
    var alertMessage: Observable<String?> = Observable(nil)
    
    private let coordinator: LoginCoordinatorProtocol
    init(coordinator: LoginCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func login() {
        isLoading.value = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            self.isLoading.value = false
                if self.email.isEmpty || self.password.isEmpty {
                self.alertMessage.value = "Email and Password couldn't be empty"
                } else {
                    let successfulLogin = self.successfulLogin(email: self.email, password: self.password)
                    if successfulLogin {
                        self.coordinator.navigateToRecipesList() // Ensure coordinator handles navigation
                    } else {
                        self.alertMessage.value = "Wrong Email or Password"
                    }
                }
            }
        }
    
    
    func updateEmail(_ text: String) {
        email = text
    }
    
    func updatePassword(_ text: String) {
        password = text
    }
    
    func validateEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self.email)
    }
    
    func validatePassword() -> Bool {
        return !self.password.isEmpty
    }
    
    func successfulLogin(email: String, password: String) -> Bool {
        return email.lowercased() == "dalia@gmail.com" && password == "123456"
    }
}
