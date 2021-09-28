//
//  HomePresenterMock.swift
//  MarvelHeroesAppTests
//
//  Created by angel.bayon on 28/9/21.
//  
//

import Foundation
@testable import MarvelHeroesApp

class HomePresenterMock : HomePresenterProtocol {
  var isHeroesCountCalled = false
  var isHeroesDataCalled = false
  var isGoToHeroCalled = false
  var isActualImageCalled = false

  func getHeroesCount() -> Int {
    isHeroesCountCalled = true
    return 0
  }

  func getHeroData(position: Int) -> SuperheroBusinessModel {
    isHeroesDataCalled = true
    return SuperheroBusinessModel()
  }

  func goToHero(position: Int) {
    isGoToHeroCalled = true
  }

  func setActualImage(data: Data) {
    isActualImageCalled = true
  }
}
