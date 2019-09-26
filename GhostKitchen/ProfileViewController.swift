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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var restrictionsLabel: UILabel!
    var dietString: String = ""
    
    let name: String! = UserDefaults.standard.string(forKey: "profile") ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //profilePic.image = #imageLiteral(resourceName: "sarah")
        dietString = ""
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "profileBack")
        backgroundImage.contentMode = UIView.ContentMode.top
        self.view.insertSubview(backgroundImage, at: 0)
        
        loadProfileData()
        
    }
    func loadProfileData(){
        for (index, item) in profile.enumerated(){
            if (profile[index].username == name) {
                profilePic.image = UIImage(imageLiteralResourceName: name)
                nameLabel.text = item.name
                addressLabel.text = profile[index].address
                phoneLabel.text = profile[index].phone
                for value in profile[index].excludedIngredients{
                    dietString.append(value)
                }
                restrictionsLabel.text = dietString
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
