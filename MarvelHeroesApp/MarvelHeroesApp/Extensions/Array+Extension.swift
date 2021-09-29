//
//  Array+Extension.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 26/9/21.
//

import Foundation

extension Array where Element: BaseProviderParamsDTO {
  func encode() -> [[String: Any]] {
    guard let jsonData = try? JSONEncoder().encode(self),
          let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]]
    else { return [[String: Any]]() }

    return json
  }
}
