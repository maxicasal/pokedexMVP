//
//  PokeTableViewCell.swift
//  MVPStart
//
//  Created by Maxi Casal on 8/18/16.
//  Copyright © 2016 Maxi Casal. All rights reserved.
//

import UIKit

class PokeTableViewCell: UITableViewCell {

  @IBOutlet var avatarImageView: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var numberLabel: UILabel!
  @IBOutlet var experienceLabel: UILabel!

  func configure(pokemon: Pokemon) {
    titleLabel.text = pokemon.name?.uppercaseString
    numberLabel.text = "\(pokemon.pokeNumber!)"
    experienceLabel.text = "\(pokemon.baseExperience!)"
    avatarImageView.image = UIImage(named: "squirtle.png")
    let url = NSURL(string: "http://pokeapi.co/media/sprites/pokemon/\(pokemon.id!).png")
    if let data = NSData(contentsOfURL: url!) {
      avatarImageView.image = UIImage(data: data)
      pokemon.avatarImage = avatarImageView.image!
    }
  }
}
