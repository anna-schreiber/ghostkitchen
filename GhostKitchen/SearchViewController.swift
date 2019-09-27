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
    
    var filteredMenu: [Menu] = []
    var filteredArray: [Menu] = []
    
    let name: String! = UserDefaults.standard.string(forKey: "profile") ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        burgerButton.layer.cornerRadius = 5
        dessertButton.layer.cornerRadius = 5
        coffeeButton.layer.cornerRadius = 5
        pizzaButton.layer.cornerRadius = 5
        subButton.layer.cornerRadius = 5
        
        self.searchTableView.rowHeight = 70
        
        searchMenu.delegate = self
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        filteredMenu = masterMenu
        
        if (name == "sarah"){
            filteredArray = filteredMenu.filter({(menuItem : Menu) -> Bool in return menuItem.keywords.contains("vegetarian")
            })
            print(filteredArray)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMenu.count
//        return masterMenu.count
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
        
        if (name == "sarah"){
            if !(filteredMenu[indexPath.row].keywords.contains("vegetarian")){
                print(cell.menuItem)
                cell.backgroundColor = UIColor.lightGray
                cell.addToCart.isHidden = true
            } else{
                cell.backgroundColor = nil
                cell.addToCart.isHidden = false
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellIdentifier = "searchTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SearchTableViewCell else {
            fatalError("The dequeued cell is not an instance of SearchTableViewCell.")
        }
        
        // Uses user defaults to add item to cart
        let menuItem: Menu = filteredMenu[indexPath.row]
        let defaults = UserDefaults.standard
        var array = defaults.object(forKey:"cart") as? [String] ?? [String]()
       // array.append(menuItem.item)
       // defaults.set(array, forKey: "cart")
        
        if (name == "sarah") {
            if !(filteredMenu[indexPath.row].keywords.contains("vegetarian")){
                // Alert that the item was added to the cart
                let alert = UIAlertController(title:"Dietary Restriction Warning", message: "This item is not vegetarian. Would you like to continue?", preferredStyle: .alert)
                let actionOK = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    self.searchTableView.deselectRow(at: indexPath, animated: false)
                    array.append(menuItem.item)
                    defaults.set(array, forKey: "cart")
                }
                let actionCancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
                alert.addAction(actionOK)
                alert.addAction(actionCancel)
                //alert.addAction(UIAlertAction(title: "Woohoo!", style: .default, handler: nil))
                self.present(alert, animated: true)
            } else{
                // Alert that the item was added to the cart
                let alert = UIAlertController(title:"Hope you're hungry!", message: "Item successfully added to cart.", preferredStyle: .alert)
                let action = UIAlertAction(title: "Woohoo!", style: UIAlertAction.Style.default) {
                    UIAlertAction in
                    self.searchTableView.deselectRow(at: indexPath, animated: false)
                    array.append(menuItem.item)
                    defaults.set(array, forKey: "cart")
                }
                alert.addAction(action)
                //alert.addAction(UIAlertAction(title: "Woohoo!", style: .default, handler: nil))
                self.present(alert, animated: true)
            }

        } else{
            // Alert that the item was added to the cart
            let alert = UIAlertController(title:"Hope you're hungry!", message: "Item successfully added to cart.", preferredStyle: .alert)
            let action = UIAlertAction(title: "Woohoo!", style: UIAlertAction.Style.default) {
                UIAlertAction in
                self.searchTableView.deselectRow(at: indexPath, animated: false)
                array.append(menuItem.item)
                defaults.set(array, forKey: "cart")
            }
            alert.addAction(action)
            //alert.addAction(UIAlertAction(title: "Woohoo!", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        filteredMenu = masterMenu.filter({(menuItem : Menu) -> Bool in return menuItem.keywords.contains(searchText.lowercased())
        })
        searchTableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool{
        return searchMenu.text?.isEmpty ?? true
    }
    
    @IBAction func displayBurgers(_ sender: Any) {
        filteredMenu = masterMenu.filter({(menuItem : Menu) -> Bool in return menuItem.keywords.contains("burger")
        })
        print(filteredMenu)
        searchTableView.reloadData()
    }
    
    @IBAction func displayDesserts(_ sender: Any) {
        filteredMenu = masterMenu.filter({(menuItem : Menu) -> Bool in return menuItem.keywords.contains("dessert")
        })
        searchTableView.reloadData()
    }
    
    @IBAction func displayCoffee(_ sender: Any) {
        filteredMenu = masterMenu.filter({(menuItem : Menu) -> Bool in return menuItem.keywords.contains("coffee")
        })
        searchTableView.reloadData()
    }
    
    @IBAction func displayPizza(_ sender: Any) {
        filteredMenu = masterMenu.filter({(menuItem : Menu) -> Bool in return menuItem.keywords.contains("pizza")
        })
        searchTableView.reloadData()
    }
    
    @IBAction func displaySubs(_ sender: Any) {
        filteredMenu = masterMenu.filter({(menuItem : Menu) -> Bool in return menuItem.keywords.contains("sub")
        })
        searchTableView.reloadData()
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
