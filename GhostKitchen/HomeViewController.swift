//
//  HomeViewController.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/17/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Initialize the collection view
    @IBOutlet weak var restaurantsCollection: UICollectionView!
    
    // Intialize variables that will be assigned when you click a restaurant image
    var selectionName: String = ""
    var selectionImage: UIImage? = UIImage()
    var selectionAddress: String = ""
    var selectionPhone: String = ""
    
    // Load the data into the restuarant object
    let data: [Restaurant] = [Restaurant(name: "McDorks", image: #imageLiteral(resourceName: "mcdorks"), address: "114 W Ronald Way",
                                         phone: "(678) 123-1234"),
                              Restaurant(name: "Subwong", image: #imageLiteral(resourceName: "Subwong"), address: "115 S Sandwich Drive", phone: "(678) 123-1234"),
                              Restaurant(name: "Out & In", image: #imageLiteral(resourceName: "out-n-in"), address: "116 E Burger Drive", phone: "(678) 123-1234"),
                              Restaurant(name: "Domiyes", image: #imageLiteral(resourceName: "domiyes"), address: "117 N Crusty Avenue", phone: "(678) 123-1234"),
                              Restaurant(name: "Wendels", image: #imageLiteral(resourceName: "wendels"), address: "118 E Curly Fry Street", phone: "(678) 123-1234"),
                              Restaurant(name: "Taco Horn", image: #imageLiteral(resourceName: "taco"), address: "118 Soft Shell Drive", phone: "(678) 123-1234")]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // Adjust size of collectiom cell
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let collectionViewSize = restaurantsCollection.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
    // Return the number of items in the data object to determine how many cells to display
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    // Loads the restaurant data into the collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = restaurantsCollection.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        cell.restaurantTitle.text = self.data[indexPath.item].name
        cell.restaurantImage.image = self.data[indexPath.item].image
        
        // Format cell to have round edges
        cell.restaurantImage.layer.cornerRadius = cell.restaurantImage.frame.size.width / 6
        cell.restaurantImage.clipsToBounds = true
    
        return cell
    }
    
    // Loads the selected restaurant into an object to be persisted to the menu screen
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectionName = data[indexPath.item].name
        selectionImage = data[indexPath.item].image
        selectionAddress = data[indexPath.item].address
        selectionPhone = data[indexPath.item].phone
        
        performSegue(withIdentifier: "showMenu", sender: nil)
    }
    
    // Persists the restaurant data from the selection to the menu screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! MenuViewController
        
        controller.selectionName = selectionName
        controller.selectionImage = selectionImage
        controller.selectionAddress = selectionAddress
        controller.selectionPhone = selectionPhone
    }

}