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
    
    // Load the menu data
    let restaurant1: [Menu] = [Menu(restaurant: "McDorks", item: "Hamburger", price: 2.50),
                               Menu(restaurant: "McDorks", item: "Bacon Cheeseburger", price: 3.00),
                               Menu(restaurant: "McDorks", item: "French Fries", price: 1.99),
                               Menu(restaurant: "McDorks", item: "Bacon Cheeseburger", price: 3.00),
                               Menu(restaurant: "McDorks", item: "Caramel Macchiato", price: 2.89)]
    
    let restaurant2: [Menu] = [Menu(restaurant: "Subwong", item: "Meatball Sub", price: 7.25),
                               Menu(restaurant: "Subwong", item: "Chicken Teriyaki", price: 6.99),
                               Menu(restaurant: "Subwong", item: "Ham & Provolone", price: 5.00),
                               Menu(restaurant: "Subwong", item: "Veggie Supreme", price: 7.00),
                               Menu(restaurant: "Subwong", item: "Loaded BLT", price: 6.99)]
    
    let restaurant3: [Menu] = [Menu(restaurant: "Out & In", item: "Classic Hamburger", price: 3.00),
                               Menu(restaurant: "Out & In", item: "Double Cheeseburger", price: 3.60),
                               Menu(restaurant: "Out & In", item: "French Fries", price: 2.50),
                               Menu(restaurant: "Out & In", item: "Chocolate Shake", price: 2.25),
                               Menu(restaurant: "Out & In", item: "Root Beer", price: 1.65)]
    
    let restaurant4: [Menu] = [Menu(restaurant: "Domiyes", item: "Sausage & Pepperoni Pizza", price: 12.99),
                               Menu(restaurant: "Domiyes", item: "Green Pepper & Onion Pizza", price: 10.99),
                               Menu(restaurant: "Domiyes", item: "Barbeque Chicken Pizza", price: 12.99),
                               Menu(restaurant: "Domiyes", item: "Jalapeno Cheese Bread", price: 6.99),
                               Menu(restaurant: "Domiyes", item: "Chocolate Lava Cake", price: 3.79)]
    
    let restaurant5: [Menu] = [Menu(restaurant: "Wendels", item: "Double Cheeseburger", price: 4.99),
                               Menu(restaurant: "Wendels", item: "Spicy Chicken Sandwich", price: 3.99),
                               Menu(restaurant: "Wendels", item: "Onion Rings", price: 2.50),
                               Menu(restaurant: "Wendels", item: "Vanilla Frosty", price: 2.89),
                               Menu(restaurant: "Wendels", item: "Chocolate Swirl Frosty", price: 3.79)]
    
    let restaurant6: [Menu] = [Menu(restaurant: "Taco Horn", item: "Steak & Cheese Burrito", price: 5.99),
                               Menu(restaurant: "Taco Horn", item: "Chicken Nacho Bowl", price: 5.99),
                               Menu(restaurant: "Taco Horn", item: "Veggie Quesadilla", price: 4.89),
                               Menu(restaurant: "Taco Horn", item: "Mexican Pizza", price: 6.39),
                               Menu(restaurant: "Taco Horn", item: "Blue-Raspberry Slushie", price: 2.15)]
    
    let masterMenu: [Menu] = [Menu(restaurant: "McDorks", item: "Hamburger", price: 2.50),
                              Menu(restaurant: "McDorks", item: "Bacon Cheeseburger", price: 3.00),
                              Menu(restaurant: "McDorks", item: "French Fries", price: 1.99),
                              Menu(restaurant: "McDorks", item: "Bacon Cheeseburger", price: 3.00),
                              Menu(restaurant: "McDorks", item: "Caramel Macchiato", price: 2.89),
                              Menu(restaurant: "Subwong", item: "Meatball Sub", price: 7.25),
                              Menu(restaurant: "Subwong", item: "Chicken Teriyaki", price: 6.99),
                              Menu(restaurant: "Subwong", item: "Ham & Provolone", price: 5.00),
                              Menu(restaurant: "Subwong", item: "Veggie Supreme", price: 7.00),
                              Menu(restaurant: "Subwong", item: "Loaded BLT", price: 6.99),
                              Menu(restaurant: "Out & In", item: "Classic Hamburger", price: 3.00),
                              Menu(restaurant: "Out & In", item: "Double Cheeseburger", price: 3.60),
                              Menu(restaurant: "Out & In", item: "French Fries", price: 2.50),
                              Menu(restaurant: "Out & In", item: "Chocolate Shake", price: 2.25),
                              Menu(restaurant: "Out & In", item: "Root Beer", price: 1.65),
                              Menu(restaurant: "Domiyes", item: "Sausage & Pepperoni Pizza", price: 12.99),
                              Menu(restaurant: "Domiyes", item: "Green Pepper & Onion Pizza", price: 10.99),
                              Menu(restaurant: "Domiyes", item: "Barbeque Chicken Pizza", price: 12.99),
                              Menu(restaurant: "Domiyes", item: "Jalapeno Cheese Bread", price: 6.99),
                              Menu(restaurant: "Domiyes", item: "Chocolate Lava Cake", price: 3.79),
                              Menu(restaurant: "Wendels", item: "Double Cheeseburger", price: 4.99),
                              Menu(restaurant: "Wendels", item: "Spicy Chicken Sandwich", price: 3.99),
                              Menu(restaurant: "Wendels", item: "Onion Rings", price: 2.50),
                              Menu(restaurant: "Wendels", item: "Vanilla Frosty", price: 2.89),
                              Menu(restaurant: "Wendels", item: "Chocolate Swirl Frosty", price: 3.79),
                              Menu(restaurant: "Taco Horn", item: "Steak & Cheese Burrito", price: 5.99),
                              Menu(restaurant: "Taco Horn", item: "Chicken Nacho Bowl", price: 5.99),
                              Menu(restaurant: "Taco Horn", item: "Veggie Quesadilla", price: 4.89),
                              Menu(restaurant: "Taco Horn", item: "Mexican Pizza", price: 6.39),
                              Menu(restaurant: "Taco Horn", item: "Blue-Raspberry Slushie", price: 2.15)]
    
    
    
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
    
    // Depending on which restaurant was selected, return that selection's menu item count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var counter: Int = 0
        for (index,item) in masterMenu.enumerated() {
            if masterMenu[index].restaurant == selectionName{
                counter += 1
            }
        }
        return counter
     }
    
    // Depending on which restaurant was selected, load that selection's menu items into menuTableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "menuTableViewCell"
         guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MenuTableViewCell else {
             fatalError("The dequeued cell is not an instance of MenuTableViewCell")
         }
        print(masterMenu[indexPath.row])
        for (index,item) in masterMenu.enumerated() {
            if masterMenu[index].restaurant == selectionName{
                print(masterMenu[index].item)
                cell.itemName.text = masterMenu[index].item
                cell.itemPrice.text = String(format: "$%.02f", masterMenu[index].price)
                
            }
            break
        }
        
        
//        if (selectionName == "McDorks"){
//            let menu = restaurant1[indexPath.row]
//            cell.itemName.text = menu.item
//            cell.itemPrice.text = String(format: "$%.02f", menu.price)
//        }
//        else if (selectionName == "Subwong"){
//            let menu = restaurant2[indexPath.row]
//            cell.itemName.text = menu.item
//            cell.itemPrice.text = String(format: "$%.02f", menu.price)
//        }
//        else if (selectionName == "Out & In"){
//            let menu = restaurant3[indexPath.row]
//            cell.itemName.text = menu.item
//            cell.itemPrice.text = String(format: "$%.02f", menu.price)
//        }
//        else if (selectionName == "Domiyes"){
//            let menu = restaurant4[indexPath.row]
//            cell.itemName.text = menu.item
//            cell.itemPrice.text = String(format: "$%.02f", menu.price)
//        } else if (selectionName == "Taco Horn"){
//            let menu = restaurant6[indexPath.row]
//            cell.itemName.text = menu.item
//            cell.itemPrice.text = String(format: "$%.02f", menu.price)
//        }
//        else {
//            let menu = restaurant5[indexPath.row]
//            cell.itemName.text = menu.item
//            cell.itemPrice.text = String(format: "$%.02f", menu.price)
//        }

         return cell
     }
}
