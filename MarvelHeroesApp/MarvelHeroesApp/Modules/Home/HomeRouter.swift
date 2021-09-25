//
//  HomeRouter.swift
//  MarvelHeroesApp
//
//  Created angel.bayon on 25/9/21.
//
//

import UIKit

protocol HomeRouterProtocol: BaseRouterProtocol {
    
}

final class HomeRouter: BaseRouter {
    weak var view: HomeViewProtocol? {
        return super.baseView as? HomeViewProtocol
    }
}

extension HomeRouter: HomeRouterProtocol {
    
}
