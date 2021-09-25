//
//  HomePresenter.swift
//  MarvelHeroesApp
//
//  Created angel.bayon on 25/9/21.
//
//

import Foundation

protocol HomePresenterProtocol: BasePresenterProtocol {

}

protocol HomeInteractorOutputProtocol: BaseInteractorOutputProtocol {

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
}

// MARK: - HomeViewProtocol
extension HomePresenter: HomePresenterProtocol {
    
}

// MARK: - HomeInteractorOutputProtocol
extension HomePresenter: HomeInteractorOutputProtocol {

}
