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
    var recipes: Observable<[RecipeCellViewModel]> = Observable([])
    let itemsPerBatch = 5
    init(coordinator: RecipesListCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    func fetchData() {
        if isLoadingData.value {
            return
        }
        isLoadingData.value = true
        let startIndex = recipes.value.count + 1
        let endpoint = RecipeEndPoint.recipe
        AlamofireManager.shared.callRequest([Recipe].self, endpoint: endpoint) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(response):
                self.recipes.value = mapToRecipesViewModels(recipes: response)
            case let .failure(error):
                print(error)
            }
            self.isLoadingData.value = false
        }

        func mapToRecipesViewModels(recipes: [Recipe]) -> [RecipeCellViewModel] {
            return recipes.map {
                RecipeCellViewModel(recipe: $0)
            }
        }
    }
    
    func getRecipeWith(indexPath: IndexPath) -> RecipeCellViewModel {
        return recipes.value[indexPath.row]
    }
    
    func toggle(indexPath: IndexPath) {
        let recipe = self.recipes.value[indexPath.row]
        recipe.isExpanded = !(recipe.isExpanded)
        recipes.value[indexPath.row] = recipe
    }

}
