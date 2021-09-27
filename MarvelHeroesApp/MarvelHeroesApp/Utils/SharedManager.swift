//
//  SharedManager.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 26/9/21.
//

import Foundation

protocol SharedManagerProtocol {
  var imageData: Data? { get set }
  var offset: Int? { get set }
}

class SharedManager: SharedManagerProtocol {
  static let shared = SharedManager()

  var imageData: Data?

  var offset: Int? = 0
}
