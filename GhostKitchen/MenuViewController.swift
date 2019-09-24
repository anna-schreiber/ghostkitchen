//
//  MenuViewController.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/18/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var selectionName: String = ""
    var selectionImage: UIImage? = UIImage()
    var selectionAddress: String = ""
    var selectionPhone: String = ""

    @IBOutlet weak var restaurantTitle: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var restaurantPhone: UILabel!
    @IBOutlet weak var menuTableView: UITableView!
    
    let restaurant1: [Menu] = [Menu(restaurant: "McDorks", item: "Hamburger", price: 2.50),
                           Menu(restaurant: "McDorks", item: "French Fries", price: 1.99)]
    
    let restaurant2: [Menu] = [Menu(restaurant: "Subwong", item: "Meatball Sub", price: 7.25)]
    
    let restaurant3: [Menu] = [Menu(restaurant: "Out & In", item: "Classic Cheeseburger", price: 4.50),
                               Menu(restaurant: "Out & In", item: "Chocolate Shake", price: 4.00)]
    
    let restaurant4: [Menu] = [Menu(restaurant: "Domiyes", item: "Sausage & Pepperoni Pizza", price: 12.99),
                               Menu(restaurant: "Domiyes", item: "Jalapeno Cheese Bread", price: 6.99),
                               Menu(restaurant: "Domiyes", item: "Chocolate Lava Cake", price: 3.79)]
    
    let restaurant5: [Menu] = [Menu(restaurant: "Wendels", item: "Vanilla Frosty", price: 2.89),
                               Menu(restaurant: "Wendels", item: "Double Cheeseburger", price: 6.99),
                               Menu(restaurant: "Wendels", item: "Onion Rings", price: 3.79)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantTitle.text = selectionName
        restaurantImage.image = selectionImage
        restaurantAddress.text = selectionAddress
        restaurantPhone.text = selectionPhone
        
        restaurantImage.layer.cornerRadius = restaurantImage.frame.size.width / 6
        restaurantImage.clipsToBounds = true
        
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
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
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (selectionName == "McDorks"){
            let selectedMenu = restaurant1
            return restaurant1.count
         }
         else if (selectionName == "Subwong") {
            let selectedMenu = restaurant2
            return restaurant2.count
         }
        else if (selectionName == "Out & In") {
           let selectedMenu = restaurant3
           return restaurant3.count
        }
        else if (selectionName == "Domiyes") {
           let selectedMenu = restaurant4
           return restaurant4.count
        }
        else if (selectionName == "Wendels") {
           let selectedMenu = restaurant5
           return restaurant5.count
        } else {return 0}
     }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "menuTableViewCell"
         guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MenuTableViewCell else {
             fatalError("The dequeued cell is not an instance of MenuTableViewCell")
         }
        if (selectionName == "McDorks"){
            let menu = restaurant1[indexPath.row]
            cell.itemName.text = menu.item
            cell.itemPrice.text = String(format: "$%.02f", menu.price)
        }
        else if (selectionName == "Subwong"){
            let menu = restaurant2[indexPath.row]
            cell.itemName.text = menu.item
            cell.itemPrice.text = String(format: "$%.02f", menu.price)
        }
        else if (selectionName == "Out & In"){
            let menu = restaurant3[indexPath.row]
            cell.itemName.text = menu.item
            cell.itemPrice.text = String(format: "$%.02f", menu.price)
        }
        else if (selectionName == "Domiyes"){
            let menu = restaurant4[indexPath.row]
            cell.itemName.text = menu.item
            cell.itemPrice.text = String(format: "$%.02f", menu.price)
        }
        else {
            let menu = restaurant5[indexPath.row]
            cell.itemName.text = menu.item
            cell.itemPrice.text = String(format: "$%.02f", menu.price)
        }

         return cell
     }
}
