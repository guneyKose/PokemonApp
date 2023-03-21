//
//  AbilityTableViewCell.swift
//  Pokemon
//
//  Created by Güney Köse on 21.03.2023.
//

import UIKit

class AbilityTableViewCell: UITableViewCell {

    @IBOutlet weak var abilityNameLabel: UILabel!
    
    func setCell(ability: Abilities?) {
        if let ability = ability {
            abilityNameLabel.text = ability.ability?.name
        }
    }
}
