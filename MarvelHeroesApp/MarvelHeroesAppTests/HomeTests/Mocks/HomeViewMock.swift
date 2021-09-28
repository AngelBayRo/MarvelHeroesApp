//
//  HomeViewMock.swift
//  MarvelHeroesAppTests
//
//  Created by angel.bayon on 28/9/21.
//  
//

import Foundation
@testable import MarvelHeroesApp

class HomeViewMock: HomeViewProtocol {
  var isReloadCalled = false
  var isShowEmptyCalled = false

  func reloadTable() {
    isReloadCalled = true
  }

  func showEmptyState() {
    isShowEmptyCalled = true
  }
}
