//
//  Date+Extension.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 25/9/21.
//

import Foundation

extension Date {
    func format(format: String) -> String {

        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = format

        return dateFormatter.string(from: self)
    }
}
