//
//  OnboardingViewController.swift
//  Recipes
//
//  Created by Dalia on 11/08/2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var GetStartButton: UIButton!
    private let viewModel: OnboardingViewModel
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}
extension OnboardingViewController {
    @IBAction func didTapGetStarted (_ sender: Any) {
        viewModel.getStarted()
    }
}
private extension OnboardingViewController {
    func configureAppearance() {
        GetStartButton.layer.cornerRadius = 12
    }
}
