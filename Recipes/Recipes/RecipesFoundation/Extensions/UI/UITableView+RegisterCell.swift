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
        let identifier = String(describing: Cell.self)
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func dequeue<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell else {
            fatalError("Unable to dequeue cell with identifier: \(identifier)")
        }
        cell.selectionStyle = .none
        return cell
    }
}
