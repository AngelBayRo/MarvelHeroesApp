//
//  HomePresenterTests.swift
//  MarvelHeroesAppTests
//
//  Created by angel.bayon on 28/9/21.
//  
//

import XCTest
@testable import MarvelHeroesApp

class HomePresenterTests: XCTestCase {

    var viewMock: HomeViewMock?
    var presenter: HomePresenter?
    var interactorMock: HomePresenterInteractorMock?
    var routerMock: HomeRouterMock?
    
    override func setUpWithError() throws {
        super.setUp()
        
        presenter = HomePresenter()
        
        routerMock = HomeRouterMock()
        interactorMock = HomePresenterInteractorMock()
        viewMock = HomeViewMock()
        
        presenter?.baseRouter = routerMock
        presenter?.baseInteractor = interactorMock
        presenter?.baseView = viewMock
    }

    override func tearDownWithError() throws {
        super.tearDown()
        
        presenter = nil
        viewMock = nil
        interactorMock = nil
        routerMock = nil
    }

  func getSuperheroBusinessModel() -> SuperheroBusinessModel {
    let comicItemModel = ComicsItem(resourceURI: "resUri", name: "nameComic")
    let storiesItem = StoriesItem(resourceURI: "resUri", name: "nameStory", type: "typeStory")

    let comics = Comics(available: 0, returned: 0, collectionURI: "uri", items: [comicItemModel])
    let stories = Stories(available: 0, returned: 0, collectionURI: "uri", items: [storiesItem])

    let url = URLElement(type: "type", url: "url")

    let serverModel = Result(id: 0,
                             name: "nameMock",
                             resultDescription: "descMock",
                             modified: "modMock",
                             resourceURI: "uriMock",
                             urls: [url],
                             thumbnail: Thumbnail(path: "path", thumbnailExtension: "thumb"),
                             comics: comics,
                             stories: stories,
                             events: comics,
                             series: comics)

    let heroModel = SuperheroBusinessModel(serverModel: serverModel)

    return heroModel
  }

  func testViewDidLoad() {
    presenter?.viewDidLoad()

    XCTAssert(interactorMock?.isGetHeroesCalled == true)
  }

  func testGetContent() {
    let businessModel = self.getSuperheroBusinessModel()
    presenter?.contentModel?.append(businessModel)

    let heroReturned = presenter?.getHeroData(position: 0)

    XCTAssertNotNil(heroReturned)
    XCTAssert(heroReturned?.id == 0)
    XCTAssertEqual(heroReturned?.name, "nameMock")
    XCTAssertEqual(heroReturned?.description, "descMock")
    XCTAssertEqual(heroReturned?.comics?.available, 0)
    XCTAssertEqual(heroReturned?.comics?.returned, 0)
    XCTAssertEqual(heroReturned?.imageThumb?.path, "path")
    XCTAssertEqual(heroReturned?.imageThumb?.thumbnailExtension, "thumb")
  }

  func testGetCount() {
    let businessModel = self.getSuperheroBusinessModel()
    presenter?.setHeroesContent(content: [businessModel])

    let count = presenter?.getHeroesCount()

    XCTAssert(presenter?.contentModel?.count == 1)
    XCTAssert(count == 1)
    XCTAssert(viewMock?.isReloadCalled == true)
  }

  func testShowErrors() {
    presenter?.showGetHeroesError()

    XCTAssert(viewMock?.isShowEmptyCalled == true)
  }

  func testGoToHero() {
    let businessModel = self.getSuperheroBusinessModel()
    presenter?.setHeroesContent(content: [businessModel])

    presenter?.goToHero(position: 0)

    XCTAssert(routerMock?.isGoToHeroCalled == true)
  }
}
