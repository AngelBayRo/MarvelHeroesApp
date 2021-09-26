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
}

protocol SuperheroInteractorOutputProtocol: BaseInteractorOutputProtocol {

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
}

// MARK: - SuperheroViewProtocol
extension SuperheroPresenter: SuperheroPresenterProtocol {
    func goBack() {
        self.router?.goBack()
    }

  func viewDidLoad() {
    if let data = self.interactor?.getImageData() {
      self.view?.setHeroImage(data: data)
    }
  }
}

// MARK: - SuperheroInteractorOutputProtocol
extension SuperheroPresenter: SuperheroInteractorOutputProtocol {

}
