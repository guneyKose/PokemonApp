//
//  PokemonViewController.swift
//  Pokemon
//
//  Created by Güney Köse on 20.03.2023.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet weak var pokemonTableView: UITableView! {
        didSet {
            self.setTableView()
        }
    }
    
    let viewModel = PokemonViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = viewModel.title
        self.viewModel.fetchPokemon { success in //Fetch the first page.
            if success {
                self.viewModel.fetchPokemon(next: true) { success in //Fetch the next page.
                    if success {
                        self.reloadTable()
                    }
                }
            }
        }
    }
    
    private func setTableView() {
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        pokemonTableView.register(self.viewModel.nib, forCellReuseIdentifier: PokemonTableViewCell.id)
    }
    
    private func reloadTable() {
        DispatchQueue.main.async {
            self.pokemonTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? PokemonDetailController {
            destinationVC.viewModel.pokemon = viewModel.selectedPokemon
        }
    }
}

extension PokemonViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.id, for: indexPath)
                as? PokemonTableViewCell
        else { fatalError("Could not find \(PokemonTableViewCell.id)") }
        cell.setCell(pokemon: viewModel.pokemons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedPokemon = viewModel.pokemons[indexPath.row]
        performSegue(withIdentifier: viewModel.toDetailSegue, sender: self)
    }
}



