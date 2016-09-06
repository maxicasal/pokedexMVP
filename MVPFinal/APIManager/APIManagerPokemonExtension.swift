//
//  APIManagerPokemonExtension.swift
//  MVPStart
//
//  Created by Maxi Casal on 8/25/16.
//  Copyright © 2016 Maxi Casal. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

extension APIManager {

  func retrivePokemon(pokeID: Int, completionHandler: (pokemon: Pokemon) -> Void) {
    Alamofire.request(.GET, "\(APIManager.sharedInstance.kBasePokemonURL)\(pokeID)", parameters: nil)
      .responseJSON(options: NSJSONReadingOptions.AllowFragments) { response in
        switch response.result {
        case .Success(let JSON):
          let pokemon = self.parsePokemon(JSON)
          if let pokemonMapped = pokemon {
            completionHandler(pokemon: pokemonMapped)
          }
          break
        case .Failure(let error):
          print(error)
          break
        }
    }
  }

  private func parsePokemon(jsonResponse : AnyObject?) -> Pokemon? {
    let responseDictionary = jsonResponse as! NSDictionary
    return Mapper<Pokemon>().map(responseDictionary)!
  }
}
