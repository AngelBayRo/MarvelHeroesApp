//
//  HomeProvider.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 25/9/21.
//

import Foundation
import Alamofire

protocol HomeProviderProtocol: AnyObject {
  func getCharacters(success: @escaping (Superheroes?) -> Void, failure: @escaping () -> Void)
}

final class HomeProvider: BaseProvider, HomeProviderProtocol {
  func getCharacters(success: @escaping (Superheroes?) -> Void, failure: @escaping () -> Void) {
    let endpoint = "\(HomeProviderConstants.HomeProviderRequest.endpoint)"
    //endpoint.append(MarvelUtils.getURLParams())
    
    let dto = ProviderDTO(params: nil,
                          method: HomeProviderConstants.HomeProviderRequest.method,
                          endpoint: endpoint)

    _ = self.getProviderData(dto: dto, success: { data, code in
      do {
        let superheroesServerModel = try JSONDecoder().decode(Superheroes.self, from: data)

        success(superheroesServerModel)
      } catch {
        print(error)
        success(nil)
      }

    }, failure: {
        failure()
    })

  }
}

private struct HomeProviderConstants {
    struct HomeProviderRequest {
        static let endpoint: String = "/v1/public/characters"
        static let method: HTTPMethod = .get
    }
}
