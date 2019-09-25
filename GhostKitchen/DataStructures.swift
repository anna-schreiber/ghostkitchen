//
//  DataStructures.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/25/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import Foundation
import UIKit

struct Menu {
    let restaurant: String
    let item: String
    let price: Double
    let keywords: [String]
}

struct Restaurant {
    let name: String
    let image: UIImage
    let address: String
    let phone: String
}

struct Profile {
    let name: String
    let profPic: UIImage
    let address: String
    let phone: String
    var excludedIngredients: [String]
}

// Load the menu data
let masterMenu: [Menu] = [Menu(restaurant: "McDorks", item: "Hamburger", price: 2.50, keywords: ["burger", "mcdorks"]),
                          Menu(restaurant: "McDorks", item: "Bacon Cheeseburger", price: 3.00, keywords: ["burger","cheese","cheeseburger", "bacon", "mcdorks", "hamburger"]),
                          Menu(restaurant: "McDorks", item: "French Fries", price: 1.99, keywords: ["fries", "side", "mcdorks", "french fries"]),
                          Menu(restaurant: "McDorks", item: "Oreo Sundae", price: 3.00, keywords: ["ice cream", "dessert", "oreo", "sundae", "mcdorks"]),
                          Menu(restaurant: "McDorks", item: "Caramel Macchiato", price: 2.89, keywords: ["coffee", "caramel", "drink", "mcdorks"]),
                          Menu(restaurant: "Subwong", item: "Meatball Sub", price: 7.25, keywords: ["sub","meatball","sandwich", "subwong"]),
                          Menu(restaurant: "Subwong", item: "Chicken Teriyaki", price: 6.99, keywords: ["sub", "chicken", "teriyaki", "sandwich", "subwong"]),
                          Menu(restaurant: "Subwong", item: "Ham & Provolone", price: 5.00, keywords: ["sub", "ham", "cheese", "provolone", "sandwich", "subwong"]),
                          Menu(restaurant: "Subwong", item: "Veggie Supreme", price: 7.00, keywords: ["sub", "veggie", "vegetarian", "subwong"]),
                          Menu(restaurant: "Subwong", item: "Loaded BLT", price: 6.99, keywords: ["bacon", "BLT", "sub", "sandwich", "subwong"]),
                          Menu(restaurant: "Out & In", item: "Classic Hamburger", price: 3.00, keywords: ["burger", "out & in", "hamburger"]),
                          Menu(restaurant: "Out & In", item: "Double Cheeseburger", price: 3.60, keywords: ["burger", "cheese", "cheeseburger", "out & in", "hamburger"]),
                          Menu(restaurant: "Out & In", item: "French Fries", price: 2.50, keywords: ["fries", "side", "out & in","french fries"]),
                          Menu(restaurant: "Out & In", item: "Chocolate Shake", price: 2.25, keywords: ["dessert", "chocolate", "shake", "out & in"]),
                          Menu(restaurant: "Out & In", item: "Root Beer", price: 1.65, keywords: ["soda", "root beer", "drink", "out & in"]),
                          Menu(restaurant: "Domiyes", item: "Sausage & Pepperoni Pizza", price: 12.99, keywords: ["pizza", "sausage", "pepperoni","domiyes"]),
                          Menu(restaurant: "Domiyes", item: "Green Pepper & Onion Pizza", price: 10.99, keywords: ["pepper","onion", "pizza","domiyes"]),
                          Menu(restaurant: "Domiyes", item: "Barbeque Chicken Pizza", price: 12.99, keywords: ["barbeque", "chicken", "pizza","domiyes"]),
                          Menu(restaurant: "Domiyes", item: "Jalapeno Cheese Bread", price: 6.99, keywords: ["jalapeno", "cheese", "bread", "side","domiyes"]),
                          Menu(restaurant: "Domiyes", item: "Chocolate Lava Cake", price: 3.79, keywords: ["dessert", "chocolate", "cake", "lava","domiyes"]),
                          Menu(restaurant: "Wendels", item: "Double Cheeseburger", price: 4.99, keywords: ["cheeseburger", "burger", "cheese","wendels","hamburger"]),
                          Menu(restaurant: "Wendels", item: "Spicy Chicken Sandwich", price: 3.99, keywords: ["spicy", "chicken", "sandwich","wendels"]),
                          Menu(restaurant: "Wendels", item: "Onion Rings", price: 2.50, keywords: ["onion", "rings", "side","wendels"]),
                          Menu(restaurant: "Wendels", item: "Vanilla Frosty", price: 2.89, keywords: ["dessert", "vanilla", "frosty","wendels"]),
                          Menu(restaurant: "Wendels", item: "Chocolate Swirl Frosty", price: 3.79, keywords: ["dessert", "chocolate", "frosty","wendels"]),
                          Menu(restaurant: "Taco Horn", item: "Steak & Cheese Burrito", price: 5.99, keywords: ["steak", "cheese", "burrito","mexican","taco horn"]),
                          Menu(restaurant: "Taco Horn", item: "Chicken Nacho Bowl", price: 5.99, keywords: ["chicken", "nacho", "mexican","taco horn"]),
                          Menu(restaurant: "Taco Horn", item: "Veggie Quesadilla", price: 4.89, keywords: ["veggie", "vegetarian", "quesadilla", "mexican","taco horn"]),
                          Menu(restaurant: "Taco Horn", item: "Mexican Pizza", price: 6.39, keywords: ["mexican", "pizza","taco horn"]),
                          Menu(restaurant: "Taco Horn", item: "Blue-Raspberry Slushie", price: 2.15, keywords: ["slushie", "drink", "rasperry","taco horn"])]

// Load the data into the restuarant object
let data: [Restaurant] = [Restaurant(name: "McDorks", image: #imageLiteral(resourceName: "mcdorks"), address: "114 W Ronald Way",
                                     phone: "(678) 123-1234"),
                          Restaurant(name: "Subwong", image: #imageLiteral(resourceName: "Subwong"), address: "115 S Sandwich Drive", phone: "(678) 123-1234"),
                          Restaurant(name: "Out & In", image: #imageLiteral(resourceName: "out-n-in"), address: "116 E Burger Drive", phone: "(678) 123-1234"),
                          Restaurant(name: "Domiyes", image: #imageLiteral(resourceName: "domiyes"), address: "117 N Crusty Avenue", phone: "(678) 123-1234"),
                          Restaurant(name: "Wendels", image: #imageLiteral(resourceName: "wendels"), address: "118 E Curly Fry Street", phone: "(678) 123-1234"),
                          Restaurant(name: "Taco Horn", image: #imageLiteral(resourceName: "taco"), address: "118 Soft Shell Drive", phone: "(678) 123-1234")]
