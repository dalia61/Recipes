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
    let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        fetchDataIfNeeded()
    }

    private func setupNavigationBar() {
        title = "Recipes"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func fetchDataIfNeeded() {
        viewModel?.fetchData()
    }
    
    func bindViewModel() {
        viewModel.isLoadingData.observe(on: self) { [weak self] isLoading in
            DispatchQueue.main.async {
                if isLoading {
                    self?.view.startAnimating()
                } else {
                    self?.view.stopAnimating()
                }
            }
        }
        
        viewModel.recipes.observe(on: self) { [weak self] _ in
            guard let self = self else { return }
            self.reloadTableView()
        }
    }

}
