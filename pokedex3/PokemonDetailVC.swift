//
//  PokemonDetailVC.swift
//  pokedex3
//
//  Created by Predrag Jevtic on 9/29/17.
//  Copyright © 2017 Predrag Jevtic. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var destriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenceLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoIng: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalized
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImg.image = img
        currentEvoImg.image = img
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        pokemon.downloadPokemonDetails { 
            
            //Whatever we write will onaly ve called after the network call is complete!
            
            self.updateUI()
        }
    }
    
    func updateUI(){
    
        attackLbl.text = pokemon.attack
        defenceLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        destriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
        
            evoLbl.text = "No evolutions"
            
            nextEvoIng.isHidden = true
        } else {
        
            nextEvoIng.isHidden = false
            nextEvoIng.image = UIImage(named: pokemon.nextEvolutionId)
            let str = " Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
        
    }

    @IBAction func backBtnPress(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }

}
