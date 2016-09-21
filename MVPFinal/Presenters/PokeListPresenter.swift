//
//  PokeListPresenter.swift
//  MVPFinal
//
//  Created by Maxi Casal on 9/11/16.
//  Copyright © 2016 Maxi Casal. All rights reserved.
//

import Foundation

class PokeListPresenter {

  private var pokemonView : PokeListView?

  init() {  }

  func attachView(view: PokeListView) {
    pokemonView = view
  }

  func detachView() {
    pokemonView = nil
  }

  func getInitialPokemons() {
    for id in 1...5 {
      APIManager.sharedInstance.retrivePokemon(id, completionHandler: { (pokemon) in
        self.pokemonView?.addPokemon(pokemon)
      })
    }
  }

  func getNextPokemons(range: Int) {
    for id in range...range+5 {
      APIManager.sharedInstance.retrivePokemon(id, completionHandler: { (pokemon) in
        self.pokemonView?.addPokemon(pokemon)
      })
    }
  }
}
