//
//  AbilityHeaderView.swift
//  Pokemon
//
//  Created by Güney Köse on 21.03.2023.
//

import UIKit

class AbilityHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var pokemonImage: UIImageView!
    
    func setupHeader(imagePath: String?) {
        if let imageString = imagePath, let url = URL(string: imageString) {
            self.pokemonImage.load(url: url)
        }
    }
}
