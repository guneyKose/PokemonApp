//
//  UITableView++.swift
//  Pokemon
//
//  Created by Güney Köse on 21.03.2023.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var id: String {
        return String(describing: self)
    }
}

extension UITableViewHeaderFooterView {
    static var id: String {
        return String(describing: self)
    }
}
