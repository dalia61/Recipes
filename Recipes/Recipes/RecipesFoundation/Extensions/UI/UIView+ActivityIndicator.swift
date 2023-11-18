//
//  UIView+ActivityIndicator.swift
//  Recipes
//
//  Created by Dalia on 18/11/2023.
//

import UIKit

extension UIView {
    private static let activityIndicatorTag = 475647
    
    func startAnimating(activityColor: UIColor = .gray, backgroundColor: UIColor = .white) {
        guard viewWithTag(UIView.activityIndicatorTag) == nil else { return }
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = UIView.activityIndicatorTag
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        backgroundView.addSubview(activityIndicator)
        addSubview(backgroundView)
    }
    
    func stopAnimating() {
        if let existingIndicator = viewWithTag(UIView.activityIndicatorTag) {
            existingIndicator.removeFromSuperview()
            self.isUserInteractionEnabled = true
        }
    }
}

