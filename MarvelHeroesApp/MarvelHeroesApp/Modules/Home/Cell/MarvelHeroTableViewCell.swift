//
//  MarvelHeroTableViewCell.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 26/9/21.
//

import UIKit
import Alamofire

class MarvelHeroTableViewCell: UITableViewCell {

  @IBOutlet weak var imageHero: UIImageView!
  @IBOutlet weak var labelName: UILabel!

  var model: MarvelHeroCellModel?
  var imageData: Data?

  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func prepareForReuse() {
    super.prepareForReuse()

    self.labelName.text = ""
    self.imageHero.image = UIImage()
  }

  func configure(cellModel: MarvelHeroCellModel) {
    self.model = cellModel
    self.labelName.text = cellModel.name
    self.getImage()
  }

  func getImage() {
    guard let urlImage = model?.imageURL else {
      return
    }

    AF.request( urlImage, method: .get).response { response in
      switch response.result {
      case .success(let responseData):
        self.imageData = responseData
        self.imageHero.image = UIImage(data: responseData ?? Data(), scale:1)

      case .failure(let error):
        print("error--->",error)
      }
    }
  }
}
