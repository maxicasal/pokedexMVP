//
//  AppDelegate.swift
//  MVPStart
//
//  Created by Maxi Casal on 8/11/16.
//  Copyright © 2016 Maxi Casal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    UITabBar.appearance().backgroundColor = UIColor(hue: 0.0111, saturation: 0.77, brightness: 0.95, alpha: 1.0)
    UITabBar.appearance().tintColor = UIColor(hue: 0.6389, saturation: 0.65, brightness: 0.7, alpha: 1.0)
    return true
  }
}
