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
<<<<<<< Updated upstream
    @IBOutlet weak var recipeDes: UITextView!
=======
    @IBOutlet weak var recipeDes: UILabel!
    static let height = CGFloat(140)
>>>>>>> Stashed changes
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configure(_ viewModel: RecipeCellViewModel) {
        recipeName.text = viewModel.name
        recipeDes.text = viewModel.recipeDescription
        if let imageUrl = URL(string: viewModel.image ?? "") {
            recipeImage.kf.setImage(with: imageUrl)
        }
    }
}
