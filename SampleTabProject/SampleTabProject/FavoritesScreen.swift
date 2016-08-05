//
//  FirstViewController.swift
//  SampleTabProject
//
//  Created by Breathometer on 8/3/16.
//  Copyright © 2016 KevinHou. All rights reserved.
//

import Foundation
import UIKit

class FavoritesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var nameField: UITextField!
    
    var savedNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionViewSpacing() // Layout and spacing
        updateSavedNames() // Update view
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func savedName(sender: AnyObject) {
        if let name = nameField.text { // If typed something
            var storedNames: [String] = []
            if let data = Constants.defaults.objectForKey(Keys.favoriteContacts) {
                // If data exists
                storedNames = data as! [String]
            }
            storedNames.append(name) // Add name to list
            Constants.defaults.setObject(storedNames, forKey: Keys.favoriteContacts) // Save under NSUser defaults
            updateSavedNames() // Apply to view
        }
    }
    
    func updateSavedNames() {
        if let storedNames = Constants.defaults.objectForKey(Keys.favoriteContacts) {
            // Good practice to ensure there is a value that exists
            savedNames = storedNames as! [String]
            reloadCollectionView()
        }
    }
    
    @IBAction func resetSavedNames(sender: AnyObject) {
        Constants.defaults.setObject([], forKey: Keys.favoriteContacts) // Reset NSUserDefaults
        updateSavedNames()
    }
    
    func reloadCollectionView() {
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.collectionView.reloadData() // Reload on main thread
        })
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedNames.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CellIdentifiers.collectionCell, forIndexPath: indexPath) as! NameCell // Apply custom class
        cell.backgroundColor = Colors.white // Background color
        cell.contentView.layer.borderWidth = 1.0 // Border weight
        cell.contentView.layer.borderColor = Colors.black.CGColor // Border color
        cell.nameLabel.text = savedNames[indexPath.row] // Set content
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Selected item: \(savedNames[indexPath.row])") // Feedback
    }
    
    func collectionViewSpacing() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let cellWidth = ScreenSize.screen_width/3
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth) // Grid
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout // Apply layout
    }
    
}

