//
//  RecipesListViewModel.swift
//  Recipes
//
//  Created by Dalia on 11/08/2023.
//

import Foundation

class RecipesListViewModel{
    private let coordinator: RecipesListCoordinatorProtocol
    var reloadTableView: (() -> Void)?
    init(coordinator: RecipesListCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    var recipeCellViewModel = [RecipeCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }

}
