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
        // Do any additional setup after loading the view.
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "nugget")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        let defaults = UserDefaults.standard
        
//        let path = Bundle.main.path(forResource: "video", ofType: "mp4")
//
//        var player = AVPlayer(url: NSURL(fileURLWithPath: path!) as URL)
//
//        let playerLayer = AVPlayerLayer(player: player)
//
//        playerLayer.frame = self.view.frame
//        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
//        self.view.layer.addSublayer(playerLayer)
//
//        player.seek(to: CMTime.zero)
//        player.play()
        
        
    }

    @IBAction func loginAction(_ sender: Any) {
        if usernameTextField.text == "" {
            // Alert that the username field is empty
            let alert = UIAlertController(title:"Login Error", message: "Please enter username.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
            }
            alert.addAction(action)
            self.present(alert, animated: true)
        } else{
            print("Saving username...performing segue.")
            UserDefaults.standard.set(usernameTextField.text, forKey: "profile")
            performSegue(withIdentifier: "loginSegue", sender: self)
        }
        
    }
    
}

