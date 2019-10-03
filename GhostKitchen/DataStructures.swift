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
}

struct Profile {
    let name: String
    let username: String
    let profPic: UIImage
    let address: String
    let phone: String
    var excludedIngredients: String
}

struct Order {
    let date: String
    let time: String
    let total: String
}

// Menu data
let masterMenu: [Menu] = [Menu(restaurant: "Micky Dee's", item: "Hamburger", price: 2.50, keywords: ["burger", "mickey dee's", "dairy-free"]),
                          Menu(restaurant: "Micky Dee's", item: "Bacon Cheeseburger", price: 3.00, keywords: ["burger","cheese","cheeseburger", "bacon", "mickey dee's", "hamburger"]),
                          Menu(restaurant: "Micky Dee's", item: "French Fries", price: 1.99, keywords: ["fries", "side", "mickey dee's", "french fries", "vegetarian", "dairy-free"]),
                          Menu(restaurant: "Micky Dee's", item: "Oreo Sundae", price: 3.00, keywords: ["ice cream", "dessert", "oreo", "sundae", "mickey dee's", "vegetarian"]),
                          Menu(restaurant: "Micky Dee's", item: "Caramel Macchiato", price: 2.89, keywords: ["coffee", "caramel", "drink", "mickey dee's", "vegetarian"]),
                          Menu(restaurant: "Wichway", item: "Meatball Sub", price: 7.25, keywords: ["sub","meatball","sandwich", "Wichway"]),
                          Menu(restaurant: "Wichway", item: "Chicken Teriyaki", price: 6.99, keywords: ["sub", "chicken", "teriyaki", "sandwich", "Wichway", "dairy-free"]),
                          Menu(restaurant: "Wichway", item: "Ham & Provolone", price: 5.00, keywords: ["sub", "ham", "cheese", "provolone", "sandwich", "Wichway"]),
                          Menu(restaurant: "Wichway", item: "Veggie Supreme", price: 7.00, keywords: ["sub", "veggie", "vegetarian", "Wichway", "dairy-free"]),
                          Menu(restaurant: "Wichway", item: "Loaded BLT", price: 6.99, keywords: ["bacon", "BLT", "sub", "sandwich", "Wichway", "dairy-free"]),
                          Menu(restaurant: "Out & In", item: "Classic Hamburger", price: 3.00, keywords: ["burger", "out & in", "hamburger", "dairy-free"]),
                          Menu(restaurant: "Out & In", item: "Cheeseburger", price: 3.60, keywords: ["burger", "cheese", "cheeseburger", "out & in", "hamburger"]),
                          Menu(restaurant: "Out & In", item: "Loaded French Fries", price: 2.50, keywords: ["fries", "side", "out & in","french fries","vegetarian"]),
                          Menu(restaurant: "Out & In", item: "Chocolate Shake", price: 2.25, keywords: ["dessert", "chocolate", "shake", "out & in", "vegetarian"]),
                          Menu(restaurant: "Out & In", item: "Root Beer", price: 1.65, keywords: ["soda", "root beer", "drink", "out & in", "vegetarian", "dairy-free"]),
                          Menu(restaurant: "Domiyes", item: "Pepperoni Pizza", price: 12.99, keywords: ["pizza", "sausage", "pepperoni","domiyes"]),
                          Menu(restaurant: "Domiyes", item: "Veggie Lovers Pizza", price: 10.99, keywords: ["pepper","onion", "pizza","domiyes", "vegetarian"]),
                          Menu(restaurant: "Domiyes", item: "Barbeque Chicken Pizza", price: 12.99, keywords: ["barbeque", "chicken", "pizza","domiyes"]),
                          Menu(restaurant: "Domiyes", item: "Cheesy Garlic Bread", price: 6.99, keywords: ["jalapeno", "cheese", "bread", "side","domiyes", "vegetarian"]),
                          Menu(restaurant: "Domiyes", item: "Chocolate Lava Cake", price: 3.79, keywords: ["dessert", "chocolate", "cake", "lava","domiyes", "vegetarian"]),
                          Menu(restaurant: "Wendels", item: "Double Cheeseburger", price: 4.99, keywords: ["cheeseburger", "burger", "cheese","wendels","hamburger"]),
                          Menu(restaurant: "Wendels", item: "Spicy Chicken Sandwich", price: 3.99, keywords: ["spicy", "chicken", "sandwich","wendels", "dairy-free"]),
                          Menu(restaurant: "Wendels", item: "Onion Rings", price: 2.50, keywords: ["onion", "rings", "side","wendels", "vegetarian", "dairy-free"]),
                          Menu(restaurant: "Wendels", item: "Vanilla Frosty", price: 2.89, keywords: ["dessert", "vanilla", "frosty","wendels", "vegetarian"]),
                          Menu(restaurant: "Wendels", item: "Chocolate Swirl Frosty", price: 3.79, keywords: ["dessert", "chocolate", "frosty","wendels", "vegetarian"]),
                          Menu(restaurant: "Taco Horn", item: "Steak & Cheese Burrito", price: 5.99, keywords: ["steak", "cheese", "burrito","mexican","taco horn"]),
                          Menu(restaurant: "Taco Horn", item: "Chicken Nacho Bowl", price: 5.99, keywords: ["chicken", "nacho", "mexican","taco horn"]),
                          Menu(restaurant: "Taco Horn", item: "Veggie Quesadilla", price: 4.89, keywords: ["veggie", "vegetarian", "quesadilla", "mexican","taco horn"]),
                          Menu(restaurant: "Taco Horn", item: "Mexican Pizza", price: 6.39, keywords: ["mexican", "pizza","taco horn"]),
                          Menu(restaurant: "Taco Horn", item: "Blue-Raspberry Slushie", price: 2.15, keywords: ["slushie", "drink", "rasperry","taco horn", "vegetarian", "dairy-free"])]

// Restaurant data
let data: [Restaurant] = [Restaurant(name: "Micky Dee's", image: #imageLiteral(resourceName: "mcdorks")),
                          Restaurant(name: "Wichway", image: #imageLiteral(resourceName: "Subwong")),
                          Restaurant(name: "Out & In", image: #imageLiteral(resourceName: "out-n-in")),
                          Restaurant(name: "Domiyes", image: #imageLiteral(resourceName: "domiyes")),
                          Restaurant(name: "Wendels", image: #imageLiteral(resourceName: "wendels")),
                          Restaurant(name: "Taco Horn", image: #imageLiteral(resourceName: "taco"))]

// Profile data
let profile: [Profile] = [Profile(name: "John Smith", username: "john", profPic: #imageLiteral(resourceName: "john"), address: "21 8th Street NE", phone: "678-238-2873", excludedIngredients: "None"),
                          Profile(name: "Sarah Johnson", username: "sarah", profPic: #imageLiteral(resourceName: "sarah"), address: "21 8th Street NE", phone: "678-356-7629", excludedIngredients: "Vegetarian"),
                          Profile(name: "Taylor Green", username: "taylor", profPic: #imageLiteral(resourceName: "taylor"), address: "21 8th Street NE", phone: "404-368-8262", excludedIngredients: "Dairy Allergy"),
                          Profile(name: "Ray Weathers", username: "ray", profPic: #imageLiteral(resourceName: "ray"), address: "21 8th Street NE", phone: "404-386-9786", excludedIngredients: "Gluten allergy")]
// Past order data
let orders: [Order] = [Order(date: "9/12/2019", time: "7:49 pm", total: "$24.70"),
                       Order(date: "9/29/2019", time: "1:13 pm", total: "$17.21")]
