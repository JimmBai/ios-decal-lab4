//
//  podexTableViewCell.swift
//  PokedexLab
//
//  Created by Jim Bai on 2017/3/2.
//  Copyright © 2017年 iOS Decal. All rights reserved.
//

import UIKit

class podexTableViewCell: UITableViewCell {

    @IBOutlet var pokemonImage: UIImageView!
    @IBOutlet var pokemonName: UILabel!
    @IBOutlet var pokemonIndex: UILabel!
    @IBOutlet var pokemonKeyStats: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
