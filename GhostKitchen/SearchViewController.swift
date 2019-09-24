//
//  SearchViewController.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/19/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var burgerButton: UIButton!
    @IBOutlet weak var shakeButton: UIButton!
    @IBOutlet weak var saladButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        burgerButton.layer.cornerRadius = 5
        shakeButton.layer.cornerRadius = 5
        saladButton.layer.cornerRadius = 5
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
