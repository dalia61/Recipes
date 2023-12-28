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
        viewModel?.fetchRecipes()
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
            self.viewModel.updateCellViewModels(cellViewModels: cellViewModels)
//            self.reloadTableView()
            self.recipesTableView.reloadData()
        }
        
        viewModel.reloadTableView = { [weak self] in
            self?.recipesTableView.reloadData()
        }
    }
    
    func updateLoadingIndicator(_ isLoading: Bool) {
        if isLoading {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        }
    }
}
private extension RecipesViewController {
    func configureTableView() {
        recipesTableView.dataSource = self
        recipesTableView.delegate = self
        recipesTableView.registerCellNib(cellClass: RecipeTableViewCell.self)
        recipesTableView.estimatedRowHeight = 60
        recipesTableView.rowHeight = UITableView.automaticDimension
    }
}
extension RecipesViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell", for: indexPath) as? RecipeTableViewCell

            let recipe = viewModel.recipes[indexPath.row]
            cell?.configure(RecipeCellViewModel(recipe: recipe))

            return cell ?? UITableViewCell()
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return viewModel.recipes.count
    }
}
