//
//  ItemTableViewCell.swift
//  MVPStart
//
//  Created by Maxi Casal on 8/25/16.
//  Copyright © 2016 Maxi Casal. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
 
  @IBOutlet var avatarImageView: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var fullDescription: UITextView!

  func configure(item: Item) {
    avatarImageView.image = UIImage(named: item.imageName)
    titleLabel.text = item.name
    fullDescription.text = item.fullDescription
  }
}
