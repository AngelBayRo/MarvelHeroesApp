//
//  HomePresenterInteractorMock.swift
//  MarvelHeroesAppTests
//
//  Created by angel.bayon on 28/9/21.
//  
//

import Foundation
@testable import MarvelHeroesApp

class HomePresenterInteractorMock: HomeInteractorInputProtocol {
  var isGetHeroesCalled = false
  var isActualImageCalled = false

  func getHeroes() {
    isGetHeroesCalled = true
  }

  func setActualImageHero(data: Data) {
    isActualImageCalled = true
  }
}
