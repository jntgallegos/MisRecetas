//
//  RecipeCell.swift
//  iosMisRecetas
//
//  Created by Johnatan Gallegos Díaz on 4/18/17.
//  Copyright © 2017 Johnatan Gallegos Díaz. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var ingredientsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
