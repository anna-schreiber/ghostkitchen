//
//  HomeViewController.swift - this view is for the home screen, which displays a collection view of the restaurants
//  GhostKitchen
//
//  Created by anna.schreiber on 9/17/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Initialize the collection view
    @IBOutlet weak var restaurantsCollection: UICollectionView!
    
    // Intialize variables to remember which restaurant was clicked
    var selectionName: String = ""
    var selectionImage: UIImage? = UIImage()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add text to the navigation controller
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "RockSalt-Regular", size: 17)!, NSAttributedString.Key.foregroundColor: UIColor.red]
    }

    
    // Adjust size of collection cell
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
        cell.restaurantTitle.text = data[indexPath.item].name
        cell.restaurantImage.image = data[indexPath.item].image
        
        // Format image to have round edges
        cell.restaurantImage.layer.cornerRadius = cell.restaurantImage.frame.size.width / 7
        cell.restaurantImage.clipsToBounds = true
    
        return cell
    }
    
    // Loads the selected restaurant into an object to be persisted to the menu screen
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectionName = data[indexPath.item].name
        selectionImage = data[indexPath.item].image
        
        performSegue(withIdentifier: "showMenu", sender: nil)
    }
    
    // Persists the restaurant data to the menu screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! MenuViewController
        controller.selectionName = selectionName
        controller.selectionImage = selectionImage
    }

}
