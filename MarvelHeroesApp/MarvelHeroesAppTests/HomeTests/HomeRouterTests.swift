//
//  HomeRouterTests.swift
//  MarvelHeroesAppTests
//
//  Created by angel.bayon on 28/9/21.
//  
//

import XCTest
@testable import MarvelHeroesApp

class HomeRouterTests: XCTestCase {

    var router: HomeRouter?
    var navigationMock: NavigationViewControllerMock?
    var viewMock: BaseViewControllerMock?
    
    override func setUpWithError() throws {
        super.setUp()
        
        router = HomeRouter()
        viewMock = BaseViewControllerMock()
        navigationMock = NavigationViewControllerMock(rootViewController: viewMock!)
        
        router?.baseView = viewMock
    }

    override func tearDownWithError() throws {
        super.tearDown()
        
        router = nil
        viewMock = nil
        navigationMock = nil
    }

  func testGoToHero() {
    let dto = SuperheroAssemblyDTO(characterImageThumb: nil,
                                   name: "name",
                                   description: "description",
                                   comics: nil,
                                   urlMore: nil)

    self.router?.goToHero(dto: dto)

    XCTAssertEqual(navigationMock?.pushedViewControllerName, "SuperheroViewController")
  }
}
