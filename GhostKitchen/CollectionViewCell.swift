//
//  CollectionViewCell.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/17/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//
import UIKit
import Foundation

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantTitle: UILabel!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    func displayContent(with model: Restaurant){
        restaurantImage.image = model.image
        restaurantTitle.text = model.name
    }
}
