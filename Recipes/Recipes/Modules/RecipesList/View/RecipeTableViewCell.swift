//
//  RecipeTableViewCell.swift
//  Recipes
//
//  Created by Dalia on 12/08/2023.
//

import UIKit
import Kingfisher

class RecipeTableViewCell: UITableViewCell {
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeDes: UITextView!
    
    var viewModel: RecipeCellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        recipeImage.image = nil
        recipeName.text = nil
        recipeDes.text = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configure(_ viewModel: RecipeCellViewModel) {
        self.viewModel = viewModel
        recipeName.text = viewModel.name
        recipeDes.text = viewModel.recipeDescription
        if let imageUrl = URL(string: viewModel.image ?? "") {
            recipeImage.kf.setImage(with: imageUrl)
        }
    }
}
