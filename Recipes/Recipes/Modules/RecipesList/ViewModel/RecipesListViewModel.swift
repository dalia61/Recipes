//
//  RecipesListViewModel.swift
//  Recipes
//
//  Created by Dalia on 11/08/2023.
//

import Foundation

class RecipesListViewModel {
    private let coordinator: RecipesListCoordinatorProtocol
    var isLoadingData: Observable<Bool> = Observable(false)
    var data: Recipe?
    var recipe: Observable<[RecipeCellViewModel]> = Observable([])
    var reloadTableView: (() -> Void)?
    
    init(coordinator: RecipesListCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    var recipes: [Recipe] = [] {
        didSet {
            reloadTableView?()
        }
    }
    func fetchRecipes() {
        if isLoadingData.value {
            return
        }
        isLoadingData.value = true
        AlamofireManager.shared.callRequest([Recipe].self, data: nil,
                                            endpoint: RecipeEndPoint.recipe) { [weak self] result in
            switch result {
            case let .success(response):
                self?.bindRecipes(recipes: response)
            case let .failure(error):
                print(error)
                self?.isLoadingData.value = false
            }
        }
    }
    private var cellViewModels: [RecipeCellViewModel] = [] {
        didSet {
            recipe.value = cellViewModels
        }
    }
    func bindRecipes(recipes: [Recipe]) {
        self.recipes = recipes
        cellViewModels = recipes.compactMap { RecipeCellViewModel(recipe: $0) }
    }
    func updateCellViewModels(cellViewModels: [RecipeCellViewModel]) {
        self.cellViewModels = cellViewModels
        recipe.value = cellViewModels
    }
    func retrieveRecipe(withId id: String) -> Recipe? {
        return recipes.first { $0.recipeID == id }
    }
}
