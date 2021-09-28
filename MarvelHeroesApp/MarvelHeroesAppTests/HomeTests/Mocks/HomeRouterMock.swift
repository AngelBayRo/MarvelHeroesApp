//
//  HomeRouterMock.swift
//  MarvelHeroesAppTests
//
//  Created by angel.bayon on 28/9/21.
//  
//

import Foundation
@testable import MarvelHeroesApp

class HomeRouterMock: HomeRouterProtocol {
  var isGoToHeroCalled = false

  func goToHero(dto: SuperheroAssemblyDTO) {
    isGoToHeroCalled = true
  }
}
