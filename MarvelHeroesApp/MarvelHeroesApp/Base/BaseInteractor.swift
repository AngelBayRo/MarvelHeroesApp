//
//  BaseInteractor.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 25/9/21.
//

import Foundation
import UIKit

class BaseInteractor {
  // Declared weak for the ARC to destroy them.
  internal weak var basePresenter: BaseInteractorOutputProtocol?
  
  required init() {
    //Not implemented
  }
  
}
