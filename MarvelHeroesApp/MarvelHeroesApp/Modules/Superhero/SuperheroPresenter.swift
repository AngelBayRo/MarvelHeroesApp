//
//  SuperheroPresenter.swift
//  MarvelHeroesApp
//
//  Created angel.bayon on 26/9/21.
//
//

import Foundation

protocol SuperheroPresenterProtocol: BasePresenterProtocol {
  func goBack()
  func getUrlMoreInfo()
  func getComicsCount() -> Int
  func getComicsData(position: Int) -> HeroComicBusinessModel
}

protocol SuperheroInteractorOutputProtocol: BaseInteractorOutputProtocol {
  func setHeroComics(comics: [HeroComicBusinessModel])
}

class SuperheroPresenter: BasePresenter {
  // MARK: VIPER Dependencies
  weak var view: SuperheroViewProtocol? {
    return super.baseView as? SuperheroViewProtocol
  }
  
  var router: SuperheroRouterProtocol? {
    return super.baseRouter as? SuperheroRouterProtocol
  }
  
  var interactor: SuperheroInteractorInputProtocol? {
    return super.baseInteractor as? SuperheroInteractorInputProtocol
  }
  
  var comics: [HeroComicBusinessModel]?
}

// MARK: - SuperheroViewProtocol
extension SuperheroPresenter: SuperheroPresenterProtocol {
  func viewDidLoad() {
    if let data = self.interactor?.getImageData() {
      self.view?.setHeroImage(data: data)
    }
    self.view?.setName(name: self.interactor?.getHeroName() ?? "")
    self.view?.setDescription(description: self.interactor?.getHeroDescription() ?? "")
    
    self.interactor?.setHeroComics()
  }
  
  func goBack() {
    self.router?.goBack()
  }
  
  func getUrlMoreInfo() {
    let url = self.interactor?.getUrlMoreData() ?? ""
    
    self.router?.moreInfo(url: url)
  }
  
  func getComicsCount() -> Int {
    return comics?.count ?? 0
  }
  
  func getComicsData(position: Int) -> HeroComicBusinessModel {
    return comics?[position] ?? HeroComicBusinessModel()
  }
}

// MARK: - SuperheroInteractorOutputProtocol
extension SuperheroPresenter: SuperheroInteractorOutputProtocol {
  func setHeroComics(comics: [HeroComicBusinessModel]) {
    self.comics = comics
    self.view?.reloadTable()
  }
}
