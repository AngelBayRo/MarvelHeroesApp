//
//  MarvelHeroCellModel.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 26/9/21.
//

import Foundation

class MarvelHeroCellModel {
  var name: String?
  var imageURL: String?
  
  init(model: SuperheroBusinessModel) {
    self.name = model.name
    let path = model.imageThumb?.path ?? ""
    let extensionPath = model.imageThumb?.thumbnailExtension ?? ""
    
    self.imageURL = "\(path).\(extensionPath)"
  }
}
