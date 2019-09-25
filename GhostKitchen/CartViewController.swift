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
    
    var array = [String]()
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let array = defaults.object(forKey:"cart") as? [String] ?? [String]()
        print(array)
        
        self.cartTableView.rowHeight = 70
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let defaults = UserDefaults.standard
        let array = defaults.object(forKey:"cart") as? [String] ?? [String]()
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaults = UserDefaults.standard
        let array = defaults.object(forKey:"cart") as? [String] ?? [String]()
        let cellIdentifier = "cartTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CartTableViewCell else {
            fatalError("The dequeued cell is not an instance of CartTableViewCell.")
        }
        cell.itemName.text = array[indexPath.row]
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
