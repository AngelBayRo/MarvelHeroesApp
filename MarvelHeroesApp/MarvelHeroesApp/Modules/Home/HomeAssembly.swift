//
//  HomeAssembly.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 25/9/21.
//

import UIKit

class HomeAssembly: BaseAssembly {
  static func homeNavigationView(assemblyDTO: HomeAssemblyDTO? = nil) -> UINavigationController {
    return UINavigationController(rootViewController: homeView(assemblyDTO: assemblyDTO))
  }
  
  static func homeView(assemblyDTO: HomeAssemblyDTO? = nil) -> HomeViewController {
    let view = HomeViewController(nibName: "HomeViewController", bundle: nil)
    
    let viper = BaseAssembly.assembly(baseView: view,
                                      presenter: HomePresenter.self,
                                      router: HomeRouter.self,
                                      interactor: HomeInteractor.self)
    viper.interactor.homeAssemblyDTO = assemblyDTO
    viper.interactor.provider = HomeProvider()
    return view
  }
}
struct HomeAssemblyDTO {
  
}
