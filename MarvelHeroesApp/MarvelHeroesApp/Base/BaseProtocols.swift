//
//  BaseProtocols.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 25/9/21.
//

import Foundation

protocol BaseViewControllerProtocol: AnyObject {
    var basePresenter: BasePresenterProtocol? {get set}
}

// Protocol used to the Presenter can communicate with View
protocol BaseViewProtocol: AnyObject {

}

// Protocol used to the View can communicate with Presenter
protocol BasePresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear(animated: Bool)
    func viewDidAppear(animated: Bool)
}

extension BasePresenterProtocol {
    func viewDidLoad() {
        // Optional method
    }
    func viewWillAppear(animated: Bool) {
        // Optional method
    }
    func viewDidAppear(animated: Bool) {
        // Optional method
    }
}

// Protocol used to the Presenter can communicate with Interactor
protocol BaseInteractorInputProtocol: AnyObject {

}

// Protocol used to the Interactor can communicate with Presenter
protocol BaseInteractorOutputProtocol: AnyObject {

}

// Protocol used to the Presenter can communicate with Router
protocol BaseRouterProtocol: AnyObject {

}

// Base class used for encode params
protocol BaseProviderParamsDTO: Codable {

}

extension BaseProviderParamsDTO {
    func encode() -> [String: Any] {

        guard let jsonData = try? JSONEncoder().encode(self),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
            else { return [String: Any]() }

      return json
    }
}
