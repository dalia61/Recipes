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
        recipesTableView.estimatedRowHeight = UITableView.automaticDimension
        recipesTableView.rowHeight = UITableView.automaticDimension
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.recipesTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecipeTableViewCell = tableView.dequeue(for: indexPath)
        let recipe = viewModel.recipes.value[indexPath.row]
        cell.configure(recipe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recipes.value.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = CGFloat(130)
            return height
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: RecipeTableViewCell = tableView.cellForRow(at: indexPath) as! RecipeTableViewCell
        cell.contentView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            cell.contentView.stopAnimating()
        }
    }
}
