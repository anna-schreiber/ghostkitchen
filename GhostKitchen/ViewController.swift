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


}

