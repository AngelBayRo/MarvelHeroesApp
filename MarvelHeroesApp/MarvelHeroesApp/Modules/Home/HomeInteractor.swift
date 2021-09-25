//
//  HomeInteractor.swift
//  MarvelHeroesApp
//
//  Created angel.bayon on 25/9/21.
//
//

import Foundation

protocol HomeInteractorInputProtocol: BaseInteractorInputProtocol {

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
    
}
