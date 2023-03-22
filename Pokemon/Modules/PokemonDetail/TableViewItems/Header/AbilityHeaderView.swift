//
//  AbilityHeaderView.swift
//  Pokemon
//
//  Created by Güney Köse on 21.03.2023.
//

import UIKit

class AbilityHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func setupHeader(imagePath: String?) {
        self.activityIndicator.startAnimating()
        self.activityIndicator.isHidden = false
        if let imageString = imagePath, let url = URL(string: imageString) {
            self.pokemonImage.load(url: url) {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
        }
    }
}
