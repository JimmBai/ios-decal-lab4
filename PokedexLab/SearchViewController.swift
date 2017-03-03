//
//  SearchViewController.swift
//  PokedexLab
//
//  Created by SAMEER SURESH on 2/25/17.
//  Copyright © 2017 iOS Decal. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    var pokemonArray: [Pokemon] = []
    var filteredArray: [Pokemon] = []
    @IBOutlet var pokedexCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonArray = PokemonGenerator.getPokemonArray()
        pokedexCollectionView.delegate = self
        pokedexCollectionView.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PokemonGenerator.categoryDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokedexCell", for: indexPath) as! podexUICollectionViewCell
        cell.podexImageView.image = UIImage(named:PokemonGenerator.categoryDict[indexPath.item]!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        filteredArray = filteredPokemon(ofType:indexPath.item)
        performSegue(withIdentifier: "SearchToCategory", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "SearchToCategory" {
                if let dest = segue.destination as? CategoryViewController {
                    dest.pokemonArray = filteredArray
                }
            }
        }
    }
    
    // Utility function to iterate through pokemon array for a single category
    func filteredPokemon(ofType type: Int) -> [Pokemon] {
        var filtered: [Pokemon] = []
        for pokemon in pokemonArray {
            if (pokemon.types.contains(PokemonGenerator.categoryDict[type]!)) {
                filtered.append(pokemon)
            }
        }
        return filtered
    }


}
