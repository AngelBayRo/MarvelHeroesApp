//
//  HeroComicTableViewCell.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 26/9/21.
//

import UIKit

class HeroComicTableViewCell: UITableViewCell {

  @IBOutlet weak var comicNameLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
