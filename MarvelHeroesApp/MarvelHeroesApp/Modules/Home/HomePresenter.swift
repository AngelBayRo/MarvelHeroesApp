//
//  HomePresenter.swift
//  MarvelHeroesApp
//
//  Created angel.bayon on 25/9/21.
//
//

import Foundation

protocol HomePresenterProtocol: BasePresenterProtocol {
  func getHeroesCount() -> Int
  func getHeroData(position: Int) -> SuperheroBusinessModel
  func goToHero(position: Int)
  func setActualImage(data: Data)
}

protocol HomeInteractorOutputProtocol: BaseInteractorOutputProtocol {
  func setHeroesContent(content: [SuperheroBusinessModel])
  func showGetHeroesError()
}

class HomePresenter: BasePresenter {
  // MARK: VIPER Dependencies
  weak var view: HomeViewProtocol? {
    return super.baseView as? HomeViewProtocol
  }

  var router: HomeRouterProtocol? {
    return super.baseRouter as? HomeRouterProtocol
  }

  var interactor: HomeInteractorInputProtocol? {
    return super.baseInteractor as? HomeInteractorInputProtocol
  }

  var contentModel: [SuperheroBusinessModel]?
}

// MARK: - HomeViewProtocol
extension HomePresenter: HomePresenterProtocol {
  func viewDidLoad() {
    self.interactor?.getHeroes()
  }

  func getHeroesCount() -> Int {
    return contentModel?.count ?? 0
  }

  func getHeroData(position: Int) -> SuperheroBusinessModel {
    return contentModel?[position] ?? SuperheroBusinessModel()
  }

  func goToHero(position: Int) {
    if let hero = contentModel?[position] {
      let heroDTO = SuperheroAssemblyDTO(characterImageThumb: hero.imageThumb,
                                         name: hero.name ?? "",
                                         description: hero.description ?? "",
                                         comics: hero.comics,
                                         urlMore: hero.url)
      self.router?.goToHero(dto: heroDTO)
    }
  }

  func setActualImage(data: Data) {
    self.interactor?.setActualImageHero(data: data)
  }
}

// MARK: - HomeInteractorOutputProtocol
extension HomePresenter: HomeInteractorOutputProtocol {
  func setHeroesContent(content: [SuperheroBusinessModel]) {
    self.contentModel = content
    self.view?.reloadTable()
  }

  func showGetHeroesError() {
    self.view?.showEmptyState()
  }
}
