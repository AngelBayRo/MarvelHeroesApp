//
//  HomeViewController.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 25/9/21.
//

import UIKit

protocol HomeViewProtocol: BaseViewProtocol {
    func reloadTable()
}

class HomeViewController: BaseView {
    
    // MARK: VIPER Dependencies
    var presenter: HomePresenterProtocol? {
        return super.basePresenter as? HomePresenterProtocol
    }

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
      super.viewDidLoad()
      self.navigationController?.navigationBar.isHidden = true

      tableView.register(UINib.init(nibName: "MarvelHeroTableViewCell", bundle: nil), forCellReuseIdentifier: "MarvelHeroTableViewCell")
      tableView.dataSource = self
      tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension HomeViewController: HomeViewProtocol {
    func reloadTable() {
      self.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.presenter?.getHeroesCount() ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "MarvelHeroTableViewCell", for: indexPath) as? MarvelHeroTableViewCell ?? MarvelHeroTableViewCell()
      let businessModel = self.presenter?.getHeroData(position: indexPath.row) ?? SuperheroBusinessModel()

      let cellModel = MarvelHeroCellModel(model: businessModel)

      cell.configure(cellModel: cellModel)

      return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 60
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = tableView.cellForRow(at: indexPath) as? MarvelHeroTableViewCell

    self.presenter?.setActualImage(data: cell?.imageData ?? Data())
    self.presenter?.goToHero(position: indexPath.row)
  }
}
