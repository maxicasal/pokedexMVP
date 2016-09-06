//
//  PokeItemsViewController.swift
//  MVPStart
//
//  Created by Maxi Casal on 8/11/16.
//  Copyright © 2016 Maxi Casal. All rights reserved.
//

import UIKit

class PokeItemsViewController: UIViewController {

  private let kItemCellIdentifier = "kItemCellIdentifier"
  private var items = [Item]()
  @IBOutlet var itemsTableView: UITableView!

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    loadItemsFromPlist()
  }

  private func loadItemsFromPlist() {
    let itemsArray = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("PokeItems", ofType: "plist")!)
    for itemDict in itemsArray! {
      items.append(Item(name: itemDict["Name"] as! String,
        fullDescription: itemDict["Description"] as! String,
        imageName: itemDict["ImageName"] as! String))
    }
    itemsTableView.reloadData()
  }
}

extension PokeItemsViewController: UITableViewDataSource, UITableViewDelegate {

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let item = items[indexPath.row]
    let cell = tableView.dequeueReusableCellWithIdentifier(kItemCellIdentifier, forIndexPath: indexPath) as! ItemTableViewCell
    cell.configure(item)

    return cell
  }
}
