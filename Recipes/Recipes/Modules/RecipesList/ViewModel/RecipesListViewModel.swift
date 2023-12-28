//
//  RecipesListViewModel.swift
//  Recipes
//
//  Created by Dalia on 11/08/2023.
//

import Foundation
import Alamofire

class RecipesListViewModel {
    init() {
    }
    
    var isLoadingData: Observable<Bool> = Observable(false)
    var recipe: Observable<[RecipeCellViewModel]> = Observable([])
    var reloadTableView: (() -> Void)?
    var recipes: [Recipe] = [] {
        didSet {
            reloadTableView?()
        }
    }
    
    func fetchRecipes() {
        guard !isLoadingData.value else { return }
        isLoadingData.value = true
        
        AlamofireManager.shared.callRequest([Recipe].self, endpoint: RecipeEndPoint.recipe) { [weak self] result in
            guard let self = self else { return }
            self.isLoadingData.value = false
            switch result {
            case let .success(response):
                self.appendRecipes(recipes: response)
            case let .failure(error):
                print("Network request error: \(error)")
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
        reloadTableView?()
        self.recipes.append(contentsOf: recipes)
        cellViewModels = self.recipes.compactMap { RecipeCellViewModel(recipe: $0) }
    }
    
    func updateCellViewModels(cellViewModels: [RecipeCellViewModel]) {
        self.cellViewModels = cellViewModels
        recipe.value = cellViewModels
    }
    
    func retrieveRecipe(withId id: String) -> Recipe? {
        return recipes.first { $0.recipeID == id }
    }
}
