//
//  RecipesViewController.swift
//  Recipes
//
//  Created by Dalia on 12/08/2023.
//

import UIKit

class RecipesViewController: UIViewController {
    var viewModel: RecipesListViewModel!
    @IBOutlet weak var recipesTableView: UITableView!
    override func viewDidAppear(_ animated: Bool) {
        title = "Recipes"
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}
