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
    let publicKey = "a3ea4b8415ce93ad98226f4982ad1129"
    let privateKey = "37913096b9c9cbc331a6ce3e4aee395bde488cae"

    let hash = "\(timestamp)\(privateKey)\(publicKey)".md5

    let url = "?ts=\(timestamp)&apikey=\(publicKey)&hash=\(hash)"

    return url
  }
}
