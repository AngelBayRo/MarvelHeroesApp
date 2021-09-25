//
//  BasePresenter.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 25/9/21.
//

import Foundation
import UIKit

class BasePresenter {
    // Declared weak for the ARC to destroy them.
    internal weak var baseView: BaseViewProtocol?
    internal var baseRouter: BaseRouterProtocol?
    internal var baseInteractor: BaseInteractorInputProtocol?

    required init() {
        // Not implemented
    }
}
