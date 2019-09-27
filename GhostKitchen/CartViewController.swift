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

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let array = defaults.object(forKey:"cart") as? [String] ?? [String]()
        
        print(array)
        
        self.cartTableView.rowHeight = 70
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        checkoutButton.layer.cornerRadius = 5
        
        subtotal = 0.0
        
        checkCartStatus()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //print(array)
        subtotal = 0.0
        cartTableView.reloadData()
        //checkCartStatus()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func checkCartStatus(){
        
        let defaults = UserDefaults.standard
        let array = defaults.object(forKey:"cart") as? [String] ?? [String]()
        print(array)
        if array.count == 0{
            subtotalLabel.text = "$0.00"
            // Alert that the item was added to the cart
            let alert = UIAlertController(title:"Uh oh!", message: "Looks like your cart's empty.", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
            alert.addAction(action)
            //alert.addAction(UIAlertAction(title: "Woohoo!", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    // Persists the restaurant data from the selection to the menu screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! OrderViewController
        
        controller.orderTotal = subtotal
    }
}
