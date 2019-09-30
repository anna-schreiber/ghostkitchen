//
//  ViewController.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/17/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load background image as a subview
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "nugget")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    // Clears cart data if a user logs out
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        defaults.set([String](), forKey: "cart")
    }
    
    // When the login button is clicked, check if username field is empty
    @IBAction func loginAction(_ sender: Any) {
        if usernameTextField.text == "" {
            // Alert when the username field is empty
            let alert = UIAlertController(title:"Login Error", message: "Please enter username.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(action)
            
            self.present(alert, animated: true)
        } else{
            // Set the user default value for profile to the username
            UserDefaults.standard.set(usernameTextField.text?.lowercased(), forKey: "profile")
            
            performSegue(withIdentifier: "loginSegue", sender: self)
        }
        
    }
    
}

