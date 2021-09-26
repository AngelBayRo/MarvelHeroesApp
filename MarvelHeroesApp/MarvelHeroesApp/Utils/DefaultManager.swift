//
//  DefaultManager.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 25/9/21.
//

import Foundation
import UIKit

class DefaultManager: NSObject {

    static func getBaseUrl() -> String {
        return "http://gateway.marvel.com"
    }

    static func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        var idx = items.startIndex
        let endIdx = items.endIndex

        repeat {
            Swift.print(items[idx], separator: separator, terminator: idx == (endIdx - 1) ? terminator : separator)
            idx += 1
        }
            while idx < endIdx

    }
}
