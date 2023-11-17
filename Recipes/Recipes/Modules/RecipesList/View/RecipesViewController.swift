//
//  RecipesViewController.swift
//  Recipes
//
//  Created by Dalia on 12/08/2023.
//

import UIKit

class RecipesViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var recipesTableView: UITableView!
    var viewModel: RecipesListViewModel!
    var cellViewModel: [RecipeCellViewModel] = []
    var recipes: [Recipes] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bindViewModel()
        viewModel?.fetchData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Recipes"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    func bindViewModel() {
        viewModel.isLoadingData.observe(on: self) { [weak self] isLoading in
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
        viewModel.recipe.observe(on: self) { [weak self] cellViewModels in
            guard let self = self else { return }
            self.viewModel.updateCellViewModels(cellViewModels: cellViewModels)
            self.reloadTableView()
        }
    }
}


