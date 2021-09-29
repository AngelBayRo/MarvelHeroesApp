//
//  SuperheroRouter.swift
//  MarvelHeroesApp
//
//  Created angel.bayon on 26/9/21.
//
//

import UIKit

protocol SuperheroRouterProtocol: BaseRouterProtocol {
  func goBack()
  func moreInfo(url: String)
}

final class SuperheroRouter: BaseRouter {
  weak var view: SuperheroViewProtocol? {
    return super.baseView as? SuperheroViewProtocol
  }
}

extension SuperheroRouter: SuperheroRouterProtocol {
  func goBack() {
    self.popViewController(animated: true)
  }
  
  func moreInfo(url: String) {
    if let url = URL(string: url) {
      UIApplication.shared.open(url)
    }
  }
}
