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
        recipesTableView.estimatedRowHeight = RecipeTableViewCell.height
        recipesTableView.rowHeight = UITableView.automaticDimension
    }
    func reloadTableView() {
        DispatchQueue.main.async {
            self.recipesTableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecipeTableViewCell = tableView.dequeue(for: indexPath)
        
        let recipe = viewModel.recipes[indexPath.row]
        cell.configure(RecipeCellViewModel(recipe: recipe))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recipes.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RecipeTableViewCell.height
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.size.height {
            viewModel.fetchData()
        }
    }
}
