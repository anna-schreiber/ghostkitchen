//
//  HomeViewController.swift
//  GhostKitchen
//
//  Created by anna.schreiber on 9/17/19.
//  Copyright © 2019 anna.schreiber. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var restaurantsCollection: UICollectionView!
    
    var selectionName: String = ""
    var selectionImage: UIImage? = UIImage()
    var selectionAddress: String = ""
    var selectionPhone: String = ""
    
    let data: [Restaurant] = [Restaurant(name: "McDorks", image: #imageLiteral(resourceName: "mcdorks"), address: "114 W Ronald Way", phone: "(678) 123-1234"),
                              Restaurant(name: "Subwong", image: #imageLiteral(resourceName: "Subwong"), address: "115 S Sandwich Drive", phone: "(678) 123-1234"),
                              Restaurant(name: "Out & In", image: #imageLiteral(resourceName: "out-n-in"), address: "116 E Burger Drive", phone: "(678) 123-1234"),
                              Restaurant(name: "Domiyes", image: #imageLiteral(resourceName: "domiyes"), address: "117 N Crusty Avenue", phone: "(678) 123-1234"),
                              Restaurant(name: "Wendels", image: #imageLiteral(resourceName: "wendels"), address: "118 E Curly Fry Street", phone: "(678) 123-1234")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let collectionViewSize = restaurantsCollection.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = restaurantsCollection.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        cell.restaurantTitle.text = self.data[indexPath.item].name
        cell.restaurantImage.image = self.data[indexPath.item].image
        
        // Format cell to have round edges
        cell.restaurantImage.layer.cornerRadius = cell.restaurantImage.frame.size.width / 6
        cell.restaurantImage.clipsToBounds = true
        
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
//        cell.restaurantImage.isUserInteractionEnabled = true
//        cell.restaurantImage.addGestureRecognizer(tapGestureRecognizer)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectionName = data[indexPath.item].name
        selectionImage = data[indexPath.item].image
        selectionAddress = data[indexPath.item].address
        selectionPhone = data[indexPath.item].phone
//        print(selectionName)
//        let destinationVC = MenuViewController()
//        destinationVC.selectionName = selectionName
        
        performSegue(withIdentifier: "showMenu", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! MenuViewController
        controller.selectionName = selectionName
        controller.selectionImage = selectionImage
        controller.selectionAddress = selectionAddress
        controller.selectionPhone = selectionPhone
//        var selection = Restaurant(name: data[], image: <#T##UIImage#>)
//        if (segue.identifier == "showMenu") {
//            let vc = segue.destination as! MenuViewController
//            vc. = ":"
//        }
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as UICollectionViewCell
           
           cell.backgroundColor = self.randomColor()
               
               
           return cell
    }
    
    //UICollectionViewDelegateFlowLayout methods
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat
    {
        
        return 5;
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat
    {
        
        return 5;
    }
    
    //UICollectionViewDatasource methods
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 100
    }

    // custom function to generate a random UIColor
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

    
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
