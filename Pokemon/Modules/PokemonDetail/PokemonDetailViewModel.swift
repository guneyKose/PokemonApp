//
//  PokemonDetailViewModel.swift
//  Pokemon
//
//  Created by Güney Köse on 21.03.2023.
//

import Foundation
import UIKit

final class PokemonDetailViewModel {
    var pokemon: Pokemon?
    let nib = UINib(nibName: AbilityTableViewCell.id, bundle: nil)
    let headerNib = UINib(nibName: AbilityHeaderView.id, bundle: nil)
    var cellHeight: CGFloat {
        return 60
    }
}
