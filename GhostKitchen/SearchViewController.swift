//
//  SearchViewController.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/19/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    

    @IBOutlet weak var searchMenu: UISearchBar!
    
    @IBOutlet weak var burgerButton: UIButton!
    @IBOutlet weak var dessertButton: UIButton!
    @IBOutlet weak var coffeeButton: UIButton!
    @IBOutlet weak var pizzaButton: UIButton!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var searchTableView: UITableView!
    
    // Initialize empty arrays to hold filtered menu
    var filteredMenu: [Menu] = []
    
    // Initialize variable to receive the user's name
    let name: String! = UserDefaults.standard.string(forKey: "profile") ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Round edges of filter buttons
        burgerButton.layer.cornerRadius = 5
        dessertButton.layer.cornerRadius = 5
        coffeeButton.layer.cornerRadius = 5
        pizzaButton.layer.cornerRadius = 5
        subButton.layer.cornerRadius = 5
        
        self.searchTableView.rowHeight = 70
        
        searchMenu.delegate = self
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        // Upon load, show all menu items
        filteredMenu = masterMenu
    }
    
    // Return the number of items in the menu array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "searchTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SearchTableViewCell else {
            fatalError("The dequeued cell is not an instance of SearchTableViewCell.")
        }
        
        // Set the restuarant image
        for (index, item) in data.enumerated(){
            if (data[index].name == filteredMenu[indexPath.row].restaurant){
                cell.restaurantImage.image = data[index].image
            }
        }
        cell.restaurantName.text = filteredMenu[indexPath.row].restaurant
        cell.menuItem.text = filteredMenu[indexPath.row].item
        cell.itemPrice.text = String(format: "$%.02f", filteredMenu[indexPath.row].price)
        
        // Vegetarian use case: if the current user is Sarah, gray out non-vegetarian items
        if (name == "sarah"){
            if !(filteredMenu[indexPath.row].keywords.contains("vegetarian")){
                print(cell.menuItem)
                cell.backgroundColor = UIColor.lightGray
                cell.addToCart.isHidden = true
                cell.vegImage.isHidden = true
            } else{
                cell.backgroundColor = nil
                cell.addToCart.isHidden = false
                // Displays vegetarian item icon
                cell.vegImage.isHidden = false
                cell.vegImage.image = UIImage(named: "veg-icon")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellIdentifier = "searchTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SearchTableViewCell else {
            fatalError("The dequeued cell is not an instance of SearchTableViewCell.")
        }
        
        // Add the selected menu item to the cart
        let menuItem: Menu = filteredMenu[indexPath.row]
        let defaults = UserDefaults.standard
        var array = defaults.object(forKey:"cart") as? [String] ?? [String]()
        
        // Vegetarian use case: if the current user is Sarah, display a dietary warning if a non-vegetarian item is clicked
        if (name == "sarah") {
            if !(filteredMenu[indexPath.row].keywords.contains("vegetarian")){
                let alert = UIAlertController(title:"Dietary Restriction Warning", message: "This item is not vegetarian. Would you like to continue?", preferredStyle: .alert)
                let actionOK = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    // If 'yes' is clicked, add item to cart
                    self.searchTableView.deselectRow(at: indexPath, animated: false)
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
                let alert = UIAlertController(title:"Hope you're hungry!", message: "Item successfully added to cart.", preferredStyle: .alert)
                let action = UIAlertAction(title: "Woohoo!", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    self.searchTableView.deselectRow(at: indexPath, animated: false)
                    array.append(menuItem.item)
                    defaults.set(array, forKey: "cart")
                }
                alert.addAction(action)
                
                self.present(alert, animated: true)
            }

        } else { // If the user's name isn't Sarah, add item to cart regardless
            let alert = UIAlertController(title:"Hope you're hungry!", message: "Item successfully added to cart.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Woohoo!", style: UIAlertAction.Style.default) {
                UIAlertAction in
                self.searchTableView.deselectRow(at: indexPath, animated: false)
                array.append(menuItem.item)
                defaults.set(array, forKey: "cart")
            }
            alert.addAction(action)
            
            self.present(alert, animated: true)
        }
    }
    
    // Reload the results each time a user types something
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        filteredMenu = masterMenu.filter({(menuItem : Menu) -> Bool in return menuItem.keywords.contains(searchText.lowercased())
        })
        searchTableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool{
        return searchMenu.text?.isEmpty ?? true
    }
    
    // Return list of burgers only
    @IBAction func displayBurgers(_ sender: Any) {
        filteredMenu = masterMenu.filter({(menuItem : Menu) -> Bool in return menuItem.keywords.contains("burger")
        })
        print(filteredMenu)
        searchTableView.reloadData()
    }
    
    // Return list of desserts only
    @IBAction func displayDesserts(_ sender: Any) {
        filteredMenu = masterMenu.filter({(menuItem : Menu) -> Bool in return menuItem.keywords.contains("dessert")
        })
        searchTableView.reloadData()
    }
    
    // Return list of coffee only
    @IBAction func displayCoffee(_ sender: Any) {
        filteredMenu = masterMenu.filter({(menuItem : Menu) -> Bool in return menuItem.keywords.contains("coffee")
        })
        searchTableView.reloadData()
    }
    
    // Return list of pizza only
    @IBAction func displayPizza(_ sender: Any) {
        filteredMenu = masterMenu.filter({(menuItem : Menu) -> Bool in return menuItem.keywords.contains("pizza")
        })
        searchTableView.reloadData()
    }
    
    // Return list of subs only
    @IBAction func displaySubs(_ sender: Any) {
        filteredMenu = masterMenu.filter({(menuItem : Menu) -> Bool in return menuItem.keywords.contains("sub")
        })
        searchTableView.reloadData()
    }

}
