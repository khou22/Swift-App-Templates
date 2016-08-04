//
//  FirstViewController.swift
//  SampleTabProject
//
//  Created by Breathometer on 8/3/16.
//  Copyright © 2016 KevinHou. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var lastSavedName: UILabel!
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        readSavedName() // Update view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func savedName(sender: AnyObject) {
        if let name = nameField.text { // If typed something
            Constants.defaults.setObject(name, forKey: Keys.favoriteContact)
            readSavedName() // Apply to view
        }
    }
    
    func readSavedName() {
        if let storedName = Constants.defaults.stringForKey(Keys.favoriteContact) {
            // Good practice to ensure there is a value that exists
            lastSavedName.text = storedName
        }
    }
    
}

