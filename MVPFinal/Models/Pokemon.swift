//
//  Pokemon.swift
//  MVPStart
//
//  Created by Maxi Casal on 8/12/16.
//  Copyright © 2016 Maxi Casal. All rights reserved.
//

import ObjectMapper
import UIKit

class Pokemon: Mappable{
  var name: String?
  var id: Int?
  var height: Int?
  var weight: Int?
  var baseExperience: Int?
  var evolutionState: Int?
  var pokeTypes: [String]?
  var pokeNumber: Int?
  var imageURL: String?
  var avatarImage: UIImage?

  required init?(_ map: Map) {
  }

  func mapping(map: Map) {
    name <- map["name"]
    id <- map["id"]
    baseExperience <- map["base_experience"]
    height <- map["height"]
    weight <- map["weight"]
    pokeNumber <- map["order"]
  }
}
