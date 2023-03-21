//
//  PokemonTableViewCell.swift
//  Pokemon
//
//  Created by Güney Köse on 21.03.2023.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
    
    func setCell(pokemon: Pokemon) {
        DispatchQueue.main.async {
            self.pokemonImage.layer.cornerRadius = self.pokemonImage.frame.height / 2
            self.pokemonImage.layer.borderColor = UIColor.label.cgColor
            self.pokemonImage.layer.borderWidth = 1
            self.pokemonNameLabel.text = pokemon.name ?? ""
            self.activityIndicator.color = UIColor.label
            
            if let imageString = pokemon.image, let url = URL(string: imageString) {
                self.pokemonImage.load(url: url)
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            } else {
                self.activityIndicator.startAnimating()
                self.activityIndicator.isHidden = false
            }
        }
    }
}
