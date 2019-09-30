//
//  CartViewController.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/25/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var checkoutButton: UIButton!
    
    var array = [String]()
    var subtotal: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the cart data
        let defaults = UserDefaults.standard
        let array = defaults.object(forKey:"cart") as? [String] ?? [String]()
        
        self.cartTableView.rowHeight = 70
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        // Round edges of checkout button
        checkoutButton.layer.cornerRadius = 5
        
        // Set total to 0 for accurate calculation
        subtotal = 0.0
        
        // Check if cart is empty
        checkCartStatus()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        subtotal = 0.0
        cartTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let defaults = UserDefaults.standard
        let array = defaults.object(forKey:"cart") as? [String] ?? [String]()
        //print(array)
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaults = UserDefaults.standard
        let array = defaults.object(forKey:"cart") as? [String] ?? [String]()
        let cellIdentifier = "cartTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CartTableViewCell else {
            fatalError("The dequeued cell is not an instance of CartTableViewCell.")
        }
        let itemName = array[indexPath.row]
        // Load the price and restaurant name for each item in the cart
        for (index, item) in masterMenu.enumerated(){
            if (masterMenu[index].item == itemName) {
                cell.itemPrice.text = String(format: "$%.02f", masterMenu[index].price)
                cell.restaurantName.text = masterMenu[index].restaurant
                subtotal += (masterMenu[index].price)
            }
        }
        cell.itemName.text = itemName
        subtotalLabel.text = String(format: "$%.02f", subtotal)
        
        return cell
    }
    
    // Check if cart is empty, if yes then display an alert
    func checkCartStatus(){
        let defaults = UserDefaults.standard
        let array = defaults.object(forKey:"cart") as? [String] ?? [String]()

        if array.count == 0{
            subtotalLabel.text = "$0.00"
            // Alert that cart is empty
            let alert = UIAlertController(title:"Uh oh!", message: "Looks like your cart's empty.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(action)
            
            self.present(alert, animated: true)
        }
    }
    
    // Persists the restaurant data from the selection to the menu screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! OrderViewController
        
        controller.orderTotal = subtotal
    }
}
