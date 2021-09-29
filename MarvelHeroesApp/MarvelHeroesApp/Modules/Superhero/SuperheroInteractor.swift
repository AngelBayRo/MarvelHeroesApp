//
//  SuperheroInteractor.swift
//  MarvelHeroesApp
//
//  Created angel.bayon on 26/9/21.
//
//

import Foundation

protocol SuperheroInteractorInputProtocol: BaseInteractorInputProtocol {
  func getImageData() -> Data
  func getUrlMoreData() -> String
  func getHeroName() -> String
  func getHeroDescription() -> String
  func setHeroComics()
}

class SuperheroInteractor: BaseInteractor {
  // MARK: VIPER Dependencies
  weak var presenter: SuperheroInteractorOutputProtocol? {
    return super.basePresenter as? SuperheroInteractorOutputProtocol
  }
  var superheroAssemblyDTO: SuperheroAssemblyDTO?
  var sharedManager: SharedManagerProtocol = SharedManager.shared
}

extension SuperheroInteractor: SuperheroInteractorInputProtocol {
  func getImageData() -> Data {
    return sharedManager.imageData ?? Data()
  }
  
  func getUrlMoreData() -> String {
    let url = superheroAssemblyDTO?.urlMore?.url ?? ""
    
    return url
  }
  
  func getHeroName() -> String {
    return superheroAssemblyDTO?.name ?? ""
  }
  
  func getHeroDescription() -> String {
    return superheroAssemblyDTO?.description ?? ""
  }
  
  func setHeroComics() {
    let comics = superheroAssemblyDTO?.comics?.items.map({ HeroComicBusinessModel(serverModel: $0) }) ?? []
    
    self.presenter?.setHeroComics(comics: comics)
  }
}
