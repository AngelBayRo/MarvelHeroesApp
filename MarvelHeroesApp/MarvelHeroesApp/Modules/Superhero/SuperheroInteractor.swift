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
}
