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
        loginViewModel.login()
    }
    
    private func bindViewModel() {
        loginViewModel.alertMessage.observe(on: self) { [weak self] message in
            guard let self = self, let message = message else { return }
            
            DispatchQueue.main.async {
                self.showAlert(withTitle: "Error", withMessage: message)
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
        textField.resignFirstResponder()
        return true
    }
}
private extension LoginViewController {
    func eyeIconVisible (_ textField: UITextField) {
        if let button = textField.rightView as? UIButton {
            button.alpha = 1.0
        }
    }
    func eyeIconTransparent (_ textField: UITextField) {
        if let button = textField.rightView as? UIButton {
            button.alpha = 0.0
        }
    }
}
