//
//  HomeInteractor.swift
//  MarvelHeroesApp
//
//  Created angel.bayon on 25/9/21.
//
//

import Foundation

protocol HomeInteractorInputProtocol: BaseInteractorInputProtocol {
  func getHeroes()
  func setActualImageHero(data: Data)
}

class HomeInteractor: BaseInteractor {
    // MARK: VIPER Dependencies
    weak var presenter: HomeInteractorOutputProtocol? {
        return super.basePresenter as? HomeInteractorOutputProtocol
    }
    var homeAssemblyDTO: HomeAssemblyDTO?
    var provider: HomeProviderProtocol?
}

extension HomeInteractor: HomeInteractorInputProtocol {
  func getHeroes() {
    self.provider?.getCharacters(success: { serverModel in
      let businessModel: [SuperheroBusinessModel] = serverModel?.data.results.map({ SuperheroBusinessModel(serverModel: $0) }) ?? []

      self.presenter?.setHeroesContent(content: businessModel)
    }, failure: {
      self.presenter?.showGetHeroesError()
    })
  }

  func setActualImageHero(data: Data) {
    var sharedManager: SharedManagerProtocol = SharedManager.shared

    sharedManager.imageData = data
  }
}
