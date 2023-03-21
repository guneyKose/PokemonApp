//
//  PokemonDetailController.swift
//  Pokemon
//
//  Created by Güney Köse on 21.03.2023.
//

import UIKit

class PokemonDetailController: UIViewController {
    
    @IBOutlet weak var abilitiesTableView: UITableView! {
        didSet {
            self.setTableView()
        }
    }
    
    let viewModel = PokemonDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    private func setTableView() {
        abilitiesTableView.delegate = self
        abilitiesTableView.dataSource = self
        abilitiesTableView.register(viewModel.nib, forCellReuseIdentifier: AbilityTableViewCell.id)
        abilitiesTableView.register(viewModel.headerNib, forHeaderFooterViewReuseIdentifier: AbilityHeaderView.id)
    }
    
    private func setup() {
        if let pokemon = viewModel.pokemon {
            self.navigationItem.title = pokemon.name
        } else {
            debugPrint("Could not find pokemon!")
        }
    }
}

extension PokemonDetailController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemon?.abilities?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AbilityTableViewCell.id, for: indexPath)
                as? AbilityTableViewCell else { fatalError("Could not find \(AbilityTableViewCell.id)") }
        if let pokemon = viewModel.pokemon {
            cell.setCell(ability: pokemon.abilities?[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: AbilityHeaderView.id)
                as? AbilityHeaderView else { fatalError("Could not find \(AbilityHeaderView.id)") }
        header.setupHeader(imagePath: viewModel.pokemon?.image)
        return header
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.view.frame.height / 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.cellHeight
    }
}
