//
//  SuperheroAssembly.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 26/9/21.
//

import UIKit

class SuperheroAssembly: BaseAssembly {
  static func superheroNavigationView(assemblyDTO: SuperheroAssemblyDTO? = nil) -> UINavigationController {
    return UINavigationController(rootViewController: superheroView(assemblyDTO: assemblyDTO))
  }
  
  static func superheroView(assemblyDTO: SuperheroAssemblyDTO? = nil) -> SuperheroViewController {
    let view = SuperheroViewController(nibName: "SuperheroViewController", bundle: nil)
    
    let viper = BaseAssembly.assembly(baseView: view,
                                      presenter: SuperheroPresenter.self,
                                      router: SuperheroRouter.self,
                                      interactor: SuperheroInteractor.self)
    viper.interactor.superheroAssemblyDTO = assemblyDTO
    return view
  }
}

struct SuperheroAssemblyDTO {
  let characterImageThumb: Thumbnail?
  let name: String
  let description: String
  let comics: Comics?
  let urlMore: URLElement?
}
