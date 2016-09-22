//
//  PokeItemsViewController.swift
//  MVPStart
//
//  Created by Maxi Casal on 8/11/16.
//  Copyright © 2016 Maxi Casal. All rights reserved.
//

import UIKit

class PokeItemsViewController: UIViewController {

  @IBOutlet var itemsTableView: UITableView!

  private let kItemCellIdentifier = "kItemCellIdentifier"
  private var items = [Item]()
  private var presenter = PokeItemsPresenter()

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    presenter.attachView(self)
    presenter.getItems()
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

extension PokeItemsViewController: PokeItemsView {

  func getPokeItems(items: [Item]) {
    self.items = items
    itemsTableView.reloadData()
  }
}