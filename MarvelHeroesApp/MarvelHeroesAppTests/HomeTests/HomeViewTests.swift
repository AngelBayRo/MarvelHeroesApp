//
//  HomeViewTests.swift
//  MarvelHeroesAppTests
//
//  Created by angel.bayon on 28/9/21.
//  
//

import XCTest
@testable import MarvelHeroesApp

class HomeViewTests: XCTestCase {
  var viewController: HomeViewController?
  var presenter: HomePresenterMock?

  override func setUpWithError() throws {
    super.setUp()

    viewController = HomeAssembly.homeView()
    presenter = HomePresenterMock()

    viewController?.basePresenter = self.presenter
    viewController?.beginAppearanceTransition(true, animated: false)
  }

  override func tearDownWithError() throws {
    super.tearDown()

    viewController = nil
    presenter = nil
  }

  func testSetupTableView() {
    XCTAssertNotNil(viewController?.tableView.delegate)
  }

  func testTableViewDelegates() {
    let count = viewController?.tableView(.init(), numberOfRowsInSection: 0)

    XCTAssert(count == 0)
    XCTAssert(presenter?.isHeroesCountCalled == true)
  }
}
