//
//  HomeInteractorTests.swift
//  MarvelHeroesAppTests
//
//  Created by angel.bayon on 28/9/21.
//  
//

import XCTest
@testable import MarvelHeroesApp

class HomeInteractorTests: XCTestCase {

    var interactor: HomeInteractor?
    var providerMock: HomeProviderMock?
    var presenterMock: HomeInteractorPresenterMock?
    
    override func setUpWithError() throws {
        super.setUp()
        
        interactor = HomeInteractor()
        providerMock = HomeProviderMock()
        presenterMock = HomeInteractorPresenterMock()
        
        interactor?.provider = providerMock
        interactor?.basePresenter = presenterMock
    }

    override func tearDownWithError() throws {
        super.tearDown()
        
        interactor = nil
        providerMock = nil
        presenterMock = nil
    }

  func testGetHeroesSuccess() {
    providerMock?.willSuccess = true

    interactor?.getHeroes()

    XCTAssert(presenterMock?.isHeroesContentCalled == true)
    XCTAssert(providerMock?.isSuccess == true)
  }

  func testGetHeroesFailure() {
    providerMock?.willSuccess = false

    interactor?.getHeroes()

    XCTAssert(presenterMock?.isShowGetHeroesCalled == true)
    XCTAssert(providerMock?.isSuccess == false)
  }
}
