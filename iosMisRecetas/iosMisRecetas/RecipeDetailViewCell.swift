//
//  RecipeDetailViewCell.swift
//  iosMisRecetas
//
//  Created by Johnatan Gallegos Díaz on 4/20/17.
//  Copyright © 2017 Johnatan Gallegos Díaz. All rights reserved.
//

import UIKit

class RecipeDetailViewCell: UITableViewCell {
    
    @IBOutlet var keyLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
