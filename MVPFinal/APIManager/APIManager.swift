//
//  APIManager.swift
//  MVPStart
//
//  Created by Maxi Casal on 8/25/16.
//  Copyright © 2016 Maxi Casal. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
  let kBasePokemonURL = "http://pokeapi.co/api/v2/pokemon/"

  struct Static {
    static var instance: APIManager?
  }

  class var sharedInstance : APIManager {

    if(Static.instance == nil) {
      Static.instance = APIManager()
    }

    return Static.instance!
  }

  class func trustAllCertificates() {
    let manager = Alamofire.Manager.sharedInstance
    manager.delegate.sessionDidReceiveChallenge = { session, challenge in
      var disposition: NSURLSessionAuthChallengeDisposition = .PerformDefaultHandling
      var credential: NSURLCredential?
      if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
        disposition = NSURLSessionAuthChallengeDisposition.UseCredential
        credential = NSURLCredential(forTrust: challenge.protectionSpace.serverTrust!)
      } else {
        if challenge.previousFailureCount > 0 {
          disposition = .CancelAuthenticationChallenge
        } else {
          credential = manager.session.configuration.URLCredentialStorage?.defaultCredentialForProtectionSpace(challenge.protectionSpace)
          if credential != nil {
            disposition = .UseCredential
          }
        }
      }
      return (disposition, credential)
    }
  }
}
