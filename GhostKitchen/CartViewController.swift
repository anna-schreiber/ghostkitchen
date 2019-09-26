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
    
    var array = [String]()
    var subtotal: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let array = defaults.object(forKey:"cart") as? [String] ?? [String]()
        
        
        self.cartTableView.rowHeight = 70
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        subtotal = 0.0
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(array)
        subtotal = 0.0
        cartTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let defaults = UserDefaults.standard
        let array = defaults.object(forKey:"cart") as? [String] ?? [String]()
        print(array)
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

}
