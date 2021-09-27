//
//  SuperheroViewController.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 26/9/21.
//

import UIKit

protocol SuperheroViewProtocol: BaseViewProtocol {
  func setHeroImage(data: Data)
  func setName(name: String)
  func setDescription(description: String)
  func reloadTable()
}

class SuperheroViewController: BaseView {

  // MARK: VIPER Dependencies
  var presenter: SuperheroPresenterProtocol? {
    return super.basePresenter as? SuperheroPresenterProtocol
  }
  
  @IBOutlet weak var imageHero: UIImageView!
  @IBOutlet weak var labelNameHero: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  @IBOutlet weak var backButton: UIButton!

  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.register(UINib.init(nibName: "HeroComicTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroComicTableViewCell")
    tableView.dataSource = self
    tableView.delegate = self
  }

  @IBAction func goBack(_ sender: Any) {
    self.presenter?.goBack()
  }

  @IBAction func moreInfoAction(_ sender: Any) {
    self.presenter?.getUrlMoreInfo()
  }

  func configureButton() {
    backButton.layer.cornerRadius = 20
    backButton.layer.masksToBounds = false
  }
}

extension SuperheroViewController: SuperheroViewProtocol {
  func setHeroImage(data: Data) {
    imageHero.image = UIImage(data: data, scale:1)
  }

  func setName(name: String) {
    labelNameHero.text = name
  }

  func setDescription(description: String) {
    descriptionLabel.text = description
  }

  func reloadTable() {
    tableView.reloadData()
  }
}

extension SuperheroViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.presenter?.getComicsCount() ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "HeroComicTableViewCell", for: indexPath) as? HeroComicTableViewCell ?? HeroComicTableViewCell()
    let businessModel = self.presenter?.getComicsData(position: indexPath.row) ?? HeroComicBusinessModel()

    let cellModel = HeroComicCellModel(model: businessModel)

    cell.configure(cellModel: cellModel)

    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 60
  }
}
