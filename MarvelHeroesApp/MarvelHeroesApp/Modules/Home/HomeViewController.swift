//
//  HomeViewController.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 25/9/21.
//

import UIKit

protocol HomeViewProtocol: BaseViewProtocol {
    
}

class HomeViewController: BaseView {
    
    // MARK: VIPER Dependencies
    var presenter: HomePresenterProtocol? {
        return super.basePresenter as? HomePresenterProtocol
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension HomeViewController: HomeViewProtocol {
    
}
