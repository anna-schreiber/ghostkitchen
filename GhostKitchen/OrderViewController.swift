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
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var subtotalLabel: UILabel!
    
    var orderTotal: Double = 0.0
    
    let name: String! = UserDefaults.standard.string(forKey: "profile") ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mapImage.image = UIImage(imageLiteralResourceName: "map")
        UIView.animate(withDuration: 2.0) {
            self.truckImage.frame.origin.x += 307
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
