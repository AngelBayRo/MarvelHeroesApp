//
//  SuperheroBusinessModel.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 26/9/21.
//

import Foundation

class SuperheroBusinessModel {
  var id: Int?
  var name: String?
  var comics: Comics?
  var url: URLElement?
  var imageThumb: Thumbnail?

  init() {}

  init(serverModel: Result) {
    self.id = serverModel.id
    self.name = serverModel.name
    self.comics = serverModel.comics
    self.url = serverModel.urls.first
    self.imageThumb = serverModel.thumbnail
  }
}
