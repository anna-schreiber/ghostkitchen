//
//  OrderCompleteViewController.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/26/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var truckImage: UIImageView!
    @IBOutlet weak var statusImage: UIImageView!
    @IBOutlet weak var journeyImage: UIImageView!
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var subtotalLabel: UILabel!
    
    // Initialize varibale to store the subtotal passed from the cart screen
    var orderTotal: Double = 0.0
    
    // Initialize variable to receive the user's name
    let name: String! = UserDefaults.standard.string(forKey: "profile") ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load map image
        mapImage.image = UIImage(imageLiteralResourceName: "map")
        
        // Animate truck image across screen
        UIView.animate(withDuration: 1.5) {
            //self.truckImage.frame.origin.x += 307
            self.statusImage.frame.size = CGSize(width: 90, height: 40)
        }
        
        loadProfileData()
        
        subtotalLabel.text = String(format: "$%.02f", orderTotal)
    }
    
    func loadProfileData(){
        for (index, item) in profile.enumerated(){
            if (profile[index].username == name) {
                addressLabel.text = profile[index].address
            }
        }
    }
}
