//
//  LoginViewController.swift
//  Recipes
//
//  Created by Dalia on 10/08/2023.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var coordinator: LoginCoordinator?
    var loginViewModel: LoginViewModel! {
        didSet {
            bindViewModel()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    
    private func configureAppearance() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.enablePasswordToggle()
    }
    
    @IBAction func didTapLogin(_ sender: Any) {
        activityIndicator.startAnimating()
        loginViewModel.login()
    }
    
    private func bindViewModel() {
        loginViewModel.alertMessage.observe(on: self) { [weak self] message in
            guard let self = self, let message = message else { return }
            DispatchQueue.main.async {
                self.showAlert(withTitle: "Error", withMessage: message)
                //self?.updateLoadingIndicator(isLoading)
            }
        }
        loginViewModel.isLoading.observe(on: self) { [weak self] isLoading in
            DispatchQueue.main.async {
                self?.updateLoadingIndicator(isLoading)
            }
        }
    }
    
    func updateLoadingIndicator(_ isLoading: Bool) {
        guard let indicator = activityIndicator else { return }
        if isLoading {
            indicator.startAnimating()
        } else {
            if indicator.isAnimating {
                indicator.stopAnimating()
            }
        }
    }
    
    func showAlert(withTitle title: String, withMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
}
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        switch textField {
        case emailTextField:
            loginViewModel?.updateEmail(text)
        case passwordTextField:
            if let button = textField.rightView as? UIButton {
                button.alpha = 0.0
            }
            loginViewModel?.updatePassword(text)
        default:
            assertionFailure("Unexpected text field: \(textField)")
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passwordTextField {
            if let button = textField.rightView as? UIButton {
                button.alpha = 1.0
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
}
