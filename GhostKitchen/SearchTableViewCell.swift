//
//  SearchTableViewCell.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/25/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var menuItem: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var addToCart: UIButton!
    @IBOutlet weak var vegImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
