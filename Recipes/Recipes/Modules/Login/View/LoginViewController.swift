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
    @IBOutlet weak var messageLabel: UILabel!
    var viewModel: LoginInputProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}
private extension LoginViewController {
    func configureAppearance() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordTextField.enablePasswordToggle()
        loginButton.isEnabled = false
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        switch textField {
        case emailTextField:
            viewModel?.updateEmail(text)
        case passwordTextField:
            if let button = textField.rightView as? UIButton {
                button.alpha = 0.0
            }
            viewModel?.updatePassword(text)
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
extension LoginViewController: LoginOutputProtocol {
    func configureButtonEnabled(onEnabled: Bool) {
        loginButton.isEnabled = onEnabled
    }
    func handelFieldState(error: String?) {
        let email = emailTextField.text ?? ""
        if let error = error {
            messageLabel.isHidden = false
            messageLabel.text = error
        } else {
            messageLabel.isHidden = true
        }
    }
}
