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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.toggle(indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var isExpanded = viewModel.getRecipeWith(indexPath: indexPath).isExpanded 
        var height = isExpanded ? CGFloat(300) : CGFloat(140)

        return height
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = scrollView.contentOffset.y
//        let contentHeight = scrollView.contentSize.height
//        
//        if offsetY > contentHeight - scrollView.frame.size.height {
//            viewModel.fetchData()
//        }
    }
}
