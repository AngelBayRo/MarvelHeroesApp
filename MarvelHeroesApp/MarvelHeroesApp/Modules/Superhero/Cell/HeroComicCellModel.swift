//
//  HeroComicCellModel.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 27/9/21.
//

import Foundation

class HeroComicCellModel {
  var name: String?

  init(model: HeroComicBusinessModel) {
    self.name = model.name
  }
}
