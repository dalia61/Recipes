//
//  UITextField.swift
//  Recipes
//
//  Created by Dalia on 12/08/2023.
//

import UIKit
extension UITextField {
    private var passwordToggleButton: UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.setImage(UIImage(systemName: "eye"), for: .selected)
        button.tintColor = .gray
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        return button
    }
    func enablePasswordToggle() {
        self.isSecureTextEntry = true
        let button = passwordToggleButton
        button.alpha = 0.0
        self.rightViewMode = .whileEditing
        self.rightView = button
    }
    @objc func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        if let button = sender as? UIButton {
            button.isSelected.toggle()
        }
    }
}

