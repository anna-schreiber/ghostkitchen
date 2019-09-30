//
//  ProfileViewController.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/18/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var ordersTableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var restrictionsLabel: UILabel!
    
    // Initialize variable to receive the user's name
    let name: String! = UserDefaults.standard.string(forKey: "profile") ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set graphic background as subview
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "profileBack")
        backgroundImage.contentMode = UIView.ContentMode.top
        self.view.insertSubview(backgroundImage, at: 0)
        
        // Load in profile data
        loadProfileData()
        
    }
    
    func loadProfileData(){
        for (index, item) in profile.enumerated(){
            if (profile[index].username == name) {
                profilePic.image = UIImage(imageLiteralResourceName: name)
                nameLabel.text = item.name
                addressLabel.text = profile[index].address
                phoneLabel.text = profile[index].phone
                restrictionsLabel.text = profile[index].excludedIngredients
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    // Load past order data into the TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "orderTableViewCell"
         guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? OrderTableViewCell else {
             fatalError("The dequeued cell is not an instance of OrderTableViewCell")
         }
        cell.dateLabel.text = orders[indexPath.row].date
        cell.timeLabel.text = orders[indexPath.row].time
        cell.totalLabel.text = orders[indexPath.row].total

         return cell
    }

}
