//
//  PokemonDetailViewController.swift
//  MVPStart
//
//  Created by Maxi Casal on 8/28/16.
//  Copyright © 2016 Maxi Casal. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

  @IBOutlet var pokenameLabel: UILabel!
  @IBOutlet var numberLabel: UILabel!
  @IBOutlet var experienceLabel: UILabel!
  @IBOutlet var heightLabel: UILabel!
  @IBOutlet var weightLabel: UILabel!
  @IBOutlet var avatarImage: UIImageView!

  var pokemon: Pokemon?

  override func viewDidLoad() {
    super.viewDidLoad()
    setupDetailsInformation()
  }

  private func setupDetailsInformation() {
    pokenameLabel.text = pokemon!.name!.uppercaseString
    numberLabel.text = "\(pokemon!.pokeNumber!)"
    experienceLabel.text = "\(pokemon!.baseExperience!)"
    heightLabel.text = "\(pokemon!.height!)"
    weightLabel.text = "\(pokemon!.weight!)"
    avatarImage.image = pokemon?.avatarImage!
  }

  @IBAction func onClosePressed(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
