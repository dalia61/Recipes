//
//  RecipesViewController+TableView.swift
//  Recipes
//
//  Created by Dalia on 17/11/2023.
//

import Foundation
import UIKit

extension RecipesViewController: UITableViewDataSource, UITableViewDelegate {
    func configureTableView() {
        recipesTableView.dataSource = self
        recipesTableView.delegate = self
        recipesTableView.registerCellNib(cellClass: RecipeTableViewCell.self)
        recipesTableView.estimatedRowHeight = 150
        recipesTableView.rowHeight = UITableView.automaticDimension
    }
    func reloadTableView() {
        DispatchQueue.main.async {
            self.recipesTableView.reloadData()
        }
    }
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
