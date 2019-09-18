//
//  MenuViewController.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/18/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var selectionName: String = ""
    var selectionImage: UIImage? = UIImage()
    var selectionAddress: String = ""
    var selectionPhone: String = ""

    @IBOutlet weak var restaurantTitle: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var restaurantPhone: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantTitle.text = selectionName
        restaurantImage.image = selectionImage
        restaurantAddress.text = selectionAddress
        restaurantPhone.text = selectionPhone
        menuImage.image = #imageLiteral(resourceName: "menu")
        
        restaurantImage.layer.cornerRadius = restaurantImage.frame.size.width / 6
        restaurantImage.clipsToBounds = true
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
