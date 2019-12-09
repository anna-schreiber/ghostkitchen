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
    @IBOutlet weak var menuTableView: UITableView!
    @IBOutlet weak var tintView: UIView!
    
    var popup: UIView!
    
    // Initialize variables to store restaurant data passed from HomeViewController
    var selectionName: String = "" // restaurant name
    var selectionImage: UIImage? = UIImage() // restaurant image
    
    // Initialize empty arrays to hold filtered menu
    var filteredArray: [Menu] = []
    
    // Initialize variable to receive the user's name
    let name: String! = UserDefaults.standard.string(forKey: "profile") ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(name)
        
        // Load the selected restaurant's info
        restaurantTitle.text = selectionName
        restaurantImage.image = selectionImage
        
        // Layer gray overlay and white text onto the restaurant image
        let overlay = UIView(frame:CGRect(x: 0, y: 60, width: 414, height: 191))
        overlay.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        view.addSubview(restaurantImage)
        view.addSubview(overlay)
        view.addSubview(restaurantTitle)
        
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        
        // Filter the array to only include items for the selected restaurant
        filteredArray = masterMenu.filter{ $0.restaurant == selectionName }
    }
    
    // The TableView only has 1 section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Depending on which restaurant was selected, return the number of menu items (size of filtered array)
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
        
        // Vegetarian use case: if the current user is Sarah, add an icon to the cell
        if (name == "sarah") || (name == "jaya") || (name == "sagarg"){
            if (filteredArray[indexPath.row].keywords.contains("vegetarian")){
                cell.vegImage.image = UIImage(named: "veg-icon")
                // icon via https://icons8.com/icons/set/vegetarian-mark--v1
            }
            
            // icon via https://icons8.com/icons/set/no-milk
        } else if (name == "taylor") || (name == "katrinad"){ // Dairy allergy use case: if the current user is Taylor, add an icon to the cell
            if (filteredArray[indexPath.row].keywords.contains("dairy-free")){
                cell.vegImage.image = UIImage(named: "dairy-icon")
                // icon via https://icons8.com/icons/set/vegetarian-mark--v1
            }
        } else {}
         return cell
     }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellIdentifier = "menuTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MenuTableViewCell else {
            fatalError("The dequeued cell is not an instance of MenuTableViewCell")
        }
        
        // Add the selected menu item to the cart
        let menuItem: Menu = filteredArray[indexPath.row]
        let defaults = UserDefaults.standard
        var array = defaults.object(forKey:"cart") as? [String] ?? [String]()
        
        // Vegetarian use case: if the current user is Sarah, display a dietary warning if a non-vegetarian item is clicked
        if (name == "sarah") || (name == "jaya") || (name == "sagarg"){
            if !(filteredArray[indexPath.row].keywords.contains("vegetarian")){
                let alert = UIAlertController(title:"Dietary Restriction Warning", message: "This item is not vegetarian. Would you like to continue?", preferredStyle: .alert)
                let actionOK = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    self.menuTableView.deselectRow(at: indexPath, animated: false)
                    // If 'yes' is clicked, add item to cart
                    array.append(menuItem.item)
                    defaults.set(array, forKey: "cart")
                }
                // If 'cancel' is clicked, do not add item to cart
                let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
                alert.addAction(actionOK)
                alert.addAction(actionCancel)
                
                self.present(alert, animated: true)
            } else {
                // Alert that the item was added to the cart
                woohooAlert()
                
                self.menuTableView.deselectRow(at: indexPath, animated: false)
                array.append(menuItem.item)
                defaults.set(array, forKey: "cart")
                
            }

        } else if(name == "taylor") || (name == "katrinad"){
            if !(filteredArray[indexPath.row].keywords.contains("dairy-free")){
                let alert = UIAlertController(title:"Dietary Restriction Warning", message: "This item contains dairy. Would you like to continue?", preferredStyle: .alert)
                let actionOK = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    self.menuTableView.deselectRow(at: indexPath, animated: false)
                    // If 'yes' is clicked, add item to cart
                    array.append(menuItem.item)
                    defaults.set(array, forKey: "cart")
                }
                // If 'cancel' is clicked, do not add item to cart
                let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
                alert.addAction(actionOK)
                alert.addAction(actionCancel)
                
                self.present(alert, animated: true)
            } else{
                // Alert that the item was added to the cart
                woohooAlert()
                
                self.menuTableView.deselectRow(at: indexPath, animated: false)
                array.append(menuItem.item)
                defaults.set(array, forKey: "cart")
            }
        } else { // If the user's name isn't Sarah, add item to cart regardless
            // Alert that the item was added to the cart
            woohooAlert()
            
            self.menuTableView.deselectRow(at: indexPath, animated: false)
            array.append(menuItem.item)
            defaults.set(array, forKey: "cart")
        }
        
    }
    func woohooAlert(){
        let alert = UIAlertController(title:"Hope you're hungry!", message: "Item successfully added to cart.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Woohoo!", style: UIAlertAction.Style.default)
        alert.addAction(action)

        self.present(alert, animated: true)
    }
}
