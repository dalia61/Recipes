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
    var recipe: Observable<[RecipeCellViewModel]> = Observable([])
    var data: Recipe?
    var reloadTableView: (() -> Void)?
    let itemsPerBatch = 5
    var currentBatch = 0
    
    init(coordinator: RecipesListCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    var recipes: [Recipe] = [] {
        didSet {
            reloadTableView?()
        }
    }
    
    func fetchData(initialFetch: Bool = true) {
        guard !isLoadingData.value else { return }
        isLoadingData.value = true
        
        let itemCountToFetch = initialFetch ? itemsPerBatch : itemsPerBatch * currentBatch
        let endpoint: RecipeEndPoint = initialFetch ? .recipe : .recipeForBatch(startIndex: currentBatch * itemsPerBatch, limit: itemCountToFetch)
        
        AlamofireManager.shared.callRequest([Recipe].self, endpoint: endpoint) { [weak self] result in
            // Handle network request result
            guard let self = self else { return }
            defer { self.isLoadingData.value = false }
            
            switch result {
            case let .success(response):
                if initialFetch {
                    self.recipes = Array(response.prefix(self.itemsPerBatch))
                } else {
                    self.appendRecipes(recipes: response)
                }
                self.isLoadingData.value = false
            case let .failure(error):
                print(error)
                self.isLoadingData.value = false
            }
        }
    }
    private var cellViewModels: [RecipeCellViewModel] = [] {
        didSet {
            recipe.value = cellViewModels
        }
    }
    private func appendRecipes(recipes: [Recipe]) {
        if recipes.isEmpty {
            isLoadingData.value = false
            return
        }
        
        if currentBatch == 1 {
            self.recipes = recipes
            cellViewModels = recipes.compactMap { RecipeCellViewModel(recipe: $0) }
        } else {
            self.recipes.append(contentsOf: recipes)
            cellViewModels = self.recipes.compactMap { RecipeCellViewModel(recipe: $0) }
        }
        
        currentBatch += 1
        reloadTableView?()
    }
    func updateCellViewModels(cellViewModels: [RecipeCellViewModel]) {
        self.cellViewModels = cellViewModels
        recipe.value = cellViewModels
    }
    func retrieveRecipe(withId id: String) -> Recipe? {
        return recipes.first { $0.recipeID == id }
    }
}
