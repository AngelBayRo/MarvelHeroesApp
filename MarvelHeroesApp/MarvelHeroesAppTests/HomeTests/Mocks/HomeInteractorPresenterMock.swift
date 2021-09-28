//
//  HomeInteractorPresenterMock.swift
//  MarvelHeroesAppTests
//
//  Created by angel.bayon on 28/9/21.
//  
//

import Foundation
@testable import MarvelHeroesApp

class HomeInteractorPresenterMock: HomeInteractorOutputProtocol {
  var isHeroesContentCalled = false
  var isShowGetHeroesCalled = false

  func setHeroesContent(content: [SuperheroBusinessModel]) {
    isHeroesContentCalled = true
  }

  func showGetHeroesError() {
    isShowGetHeroesCalled = true
  }
}
