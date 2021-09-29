//
//  HeroComicBusinessModel.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 27/9/21.
//

import Foundation


class HeroComicBusinessModel {
  var name: String?
  
  init() {}
  
  init(serverModel: ComicsItem) {
    self.name = serverModel.name
  }
}
