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
        if email.isEmpty || password.isEmpty {
            alertMessage.value = "Email and Password couldn't be empty"
            isLoading.value = false
            return
        }
        
        if !validateEmail() {
            alertMessage.value = "Invalid Email format"
            isLoading.value = false
            return
        }
        
        isLoading.value = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            let successfulLogin = self.successfulLogin(email: self.email, password: self.password)
            self.isLoading.value = false
            if successfulLogin {
                self.coordinator.navigateToRecipesList()
            } else {
                self.alertMessage.value = "Wrong Email or Password"
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
