//
//  BaseView.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 25/9/21.
//

import Foundation
import UIKit

class BaseView: UIViewController {
    internal var basePresenter: BasePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: BaseViewControllerProtocol
extension BaseView: BaseViewControllerProtocol {}
