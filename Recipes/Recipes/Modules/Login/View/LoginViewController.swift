//
//  LoginViewController.swift
//  Recipes
//
//  Created by Dalia on 10/08/2023.
//

import UIKit

class LoginViewController: UIViewController, LoginOutputProtocol {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!

    var loginViewModel: LoginViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    @IBAction func didTapLogin(_ sender: Any) {
        loginViewModel.login(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    private func configureAppearance() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.enablePasswordToggle()
        loginButton.isEnabled = false
    }
    func configureButtonEnabled(onEnabled: Bool) {
        loginButton.isEnabled = onEnabled
    }
    func handelFieldState(error: String?) {
        messageLabel.isHidden = error == nil
        messageLabel.text = error
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

