//
//  HomeProviderMock.swift
//  MarvelHeroesAppTests
//
//  Created by angel.bayon on 28/9/21.
//  
//

import Foundation
@testable import MarvelHeroesApp

class HomeProviderMock: HomeProviderProtocol {
  var isCalled = false
  var willSuccess = false
  var isSuccess: Bool?

  func getCharacters(success: @escaping (Superheroes?) -> Void, failure: @escaping () -> Void) {
    isCalled = true

    if willSuccess {
        isSuccess = true

        let serverModel = Superheroes(code: 0, status: "status", copyright: "copy", attributionText: "att", attributionHTML: "html", data: DataClass(offset: 0, limit: 0, total: 0, count: 0, results: []), etag: "etag")

        success(serverModel)
    } else {
        isSuccess = false
        failure()
    }
  }
}
