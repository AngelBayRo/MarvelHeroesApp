//
//  SuperheroViewController.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 26/9/21.
//

import UIKit

protocol SuperheroViewProtocol: BaseViewProtocol {
  func setHeroImage(data: Data)
}

class SuperheroViewController: BaseView {
    
    // MARK: VIPER Dependencies
    var presenter: SuperheroPresenterProtocol? {
        return super.basePresenter as? SuperheroPresenterProtocol
    }
  
  @IBOutlet weak var imageHero: UIImageView!
  @IBOutlet weak var labelNameHero: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    @IBAction func goBack(_ sender: Any) {
        self.presenter?.goBack()
    }

  @IBAction func moreInfoAction(_ sender: Any) {

  }
}

extension SuperheroViewController: SuperheroViewProtocol {
  func setHeroImage(data: Data) {
    self.imageHero.image = UIImage(data: data, scale:1)
  }
}
