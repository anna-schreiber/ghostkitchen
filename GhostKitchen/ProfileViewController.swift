//
//  ProfileViewController.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/18/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        profilePic.image = #imageLiteral(resourceName: "profile")
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "profileBack")
        backgroundImage.contentMode = UIView.ContentMode.top
        self.view.insertSubview(backgroundImage, at: 0)

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