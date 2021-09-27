//
//  MarvelUtils.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 26/9/21.
//

import Foundation

class MarvelUtils {
  static func getURLParams() -> String {
    let timestamp = Date().timeIntervalSince1970.description
    let publicKey = "MARVEL_PUBLIC_API_KEY"
    let privateKey = "MARVEL_PRIVATE_API_KEY"

    let offsetValue: Int = SharedManager.shared.offset ?? 0

    let publicKeyValue = self.value(key: publicKey)
    let privateKeyValue = self.value(key: privateKey)

    let hash = "\(timestamp)\(privateKeyValue)\(publicKeyValue)".md5

    let url = "?ts=\(timestamp)&apikey=\(publicKeyValue)&hash=\(hash)&limit=100&offset=\(offsetValue)"

    return url
  }

  static func value(key: String) -> String {
      let environment = ProcessInfo.processInfo.environment
      if let environmentValueString = environment[key] {
        return environmentValueString
      } else {
        return ""
    }
  }

  static func setOffset(newOffset: Int) {
    let offset = SharedManager.shared.offset

    SharedManager.shared.offset = (offset ?? 0) + newOffset
  }
}
