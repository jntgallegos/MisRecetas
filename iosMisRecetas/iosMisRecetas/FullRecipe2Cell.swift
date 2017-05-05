//
//  FullRecipe2Cell.swift
//  iosMisRecetas
//
//  Created by Johnatan Gallegos Díaz on 4/19/17.
//  Copyright © 2017 Johnatan Gallegos Díaz. All rights reserved.
//

import UIKit

class FullRecipe2Cell: UITableViewCell {
    
    
    @IBOutlet var thumbnailImageView: UIImageView!
    
    @IBOutlet var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
