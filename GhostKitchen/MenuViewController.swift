//
//  MenuViewController.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/18/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var restaurantTitle: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var restaurantPhone: UILabel!
    @IBOutlet weak var menuTableView: UITableView!
    
    // Initialize variables to hold the values passed from HomeViewController
    var selectionName: String = ""
    var selectionImage: UIImage? = UIImage()
    var selectionAddress: String = ""
    var selectionPhone: String = ""
    
    var filteredArray: [Menu] = []
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the selected restaurant's info
        restaurantTitle.text = selectionName
        restaurantImage.image = selectionImage
        restaurantAddress.text = selectionAddress
        restaurantPhone.text = selectionPhone
        
        // Round edges of photo
        restaurantImage.layer.cornerRadius = restaurantImage.frame.size.width / 6
        restaurantImage.clipsToBounds = true
        
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        
        // Filter the array to only include items for the selected restaurant
        filteredArray = masterMenu.filter{ $0.restaurant == selectionName }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Depending on which restaurant was selected, return the size of the filtered array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArray.count
     }
    
    // Depending on which restaurant was selected, load the filtered menu items into the TableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "menuTableViewCell"
         guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MenuTableViewCell else {
             fatalError("The dequeued cell is not an instance of MenuTableViewCell")
         }
        cell.itemName.text = filteredArray[indexPath.row].item
        cell.itemPrice.text = String(format: "$%.02f", filteredArray[indexPath.row].price)

         return cell
     }
}
