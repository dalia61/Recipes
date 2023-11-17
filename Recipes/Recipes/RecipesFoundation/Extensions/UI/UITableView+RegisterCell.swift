//
//  UITableView+RegisterCell.swift
//  Recipes
//
//  Created by Dalia on 15/11/2023.
//

import Foundation
import UIKit
extension UITableView {
    func registerCellNib<Cell: UITableViewCell>(cellClass: Cell.Type) {
        self.register(UINib(nibName: String(describing: Cell.self),
                            bundle: nil), forCellReuseIdentifier: String(describing: Cell.self))
    }
    func dequeue<Cell: UITableViewCell>() -> Cell? {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            return nil
        }
        cell.selectionStyle = .none
        return cell
    }

}
