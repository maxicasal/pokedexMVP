//
//  PokeItemsPresenter.swift
//  MVPFinal
//
//  Created by Maxi Casal on 9/11/16.
//  Copyright © 2016 Maxi Casal. All rights reserved.
//

import Foundation

class PokeItemsPresenter {

  private var itemsView : PokeItemsView?

  init() {  }

  func attachView(view: PokeItemsView) {
    itemsView = view
  }

  func detachView() {
    itemsView = nil
  }

  func getItems() {
    var items = [Item]()
    let itemsArray = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("PokeItems", ofType: "plist")!)
    for itemDict in itemsArray! {
      items.append(Item(name: itemDict["Name"] as! String, fullDescription: itemDict["Description"] as! String, imageName: itemDict["ImageName"] as! String))
    }
    itemsView?.getPokeItems(items)
  }
}
