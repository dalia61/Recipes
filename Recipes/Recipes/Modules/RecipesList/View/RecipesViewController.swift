//
//  RecipesViewController.swift
//  Recipes
//
//  Created by Dalia on 12/08/2023.
//

import UIKit

class RecipesViewController: UIViewController {
    @IBOutlet weak var recipesTableView: UITableView!
    var viewModel: RecipesListViewModel!
    var recipes: [Recipes] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        viewModel?.fetchRecipes()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Recipes"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
extension RecipesViewController {
    func bindTodayResult(recipes: [Recipes]) {
        self.recipes = recipes
        DispatchQueue.main.async {
            self.recipesTableView.reloadData()
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
