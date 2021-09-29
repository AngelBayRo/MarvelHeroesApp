//
//  HomeRouter.swift
//  MarvelHeroesApp
//
//  Created angel.bayon on 25/9/21.
//
//

import UIKit

protocol HomeRouterProtocol: BaseRouterProtocol {
  func goToHero(dto: SuperheroAssemblyDTO)
}

final class HomeRouter: BaseRouter {
  weak var view: HomeViewProtocol? {
    return super.baseView as? HomeViewProtocol
  }
}

extension HomeRouter: HomeRouterProtocol {
  func goToHero(dto: SuperheroAssemblyDTO) {
    self.pushViewController(SuperheroAssembly.superheroView(assemblyDTO: dto), animated: true)
  }
}
