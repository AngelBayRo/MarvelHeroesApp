//
//  HeroComicTableViewCell.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 26/9/21.
//

import UIKit

class HeroComicTableViewCell: UITableViewCell {

  @IBOutlet weak var comicNameLabel: UILabel!

  var model: HeroComicCellModel?

  override func awakeFromNib() {
        super.awakeFromNib()
    }

  override func prepareForReuse() {
    super.prepareForReuse()

    self.comicNameLabel.text = ""
  }

  func configure(cellModel: HeroComicCellModel) {
    self.model = cellModel
    self.comicNameLabel.text = cellModel.name
  }
}
