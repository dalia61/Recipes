//
//  RecipesViewController.swift
//  Recipes
//
//  Created by Dalia on 12/08/2023.
//

import UIKit

class RecipesViewController: UIViewController {
    @IBOutlet weak var recipesTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var viewModel: RecipesListViewModel!
    var recipes: [Recipes] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bindViewModel()
        viewModel.fetchRecipes()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Recipes"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
extension RecipesViewController {
    func bindViewModel() {
        viewModel.isLoadingData.observe(on: self) { [weak self] isLoading in
            DispatchQueue.main.async {
                self?.updateLoadingIndicator(isLoading)
            }
        }
        
        viewModel.recipe.observe(on: self) { [weak self] cellViewModels in
            guard let self = self else { return }
            self.reloadTableView()
            self.recipesTableView.reloadData()
        }
    }
    
    func updateLoadingIndicator(_ isLoading: Bool) {
        if isLoading {
            activityIndicator.isHidden = false
        } else {
            activityIndicator.stopAnimating()
        }
    }
}
