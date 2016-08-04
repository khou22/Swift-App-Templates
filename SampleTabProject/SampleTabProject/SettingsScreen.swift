//
//  SettingsViewController.swift
//  SampleTabProject
//
//  Created by Breathometer on 8/3/16.
//  Copyright © 2016 KevinHou. All rights reserved.
//
//  Reference: http://khou22.github.io/programming/2016/07/22/swift-tableview-basics-how-to-create-and-populate-tables.html

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let settingTitles = ["Profile", "Item 2", "Item 3", "Item 4", "Item 5"]
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        adjustForScreenSizes() // Adjust formatting for screen size
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CellIdentifiers.settingsCell)
//        tableView.setup(scrollable: false) // Turn off scrolling

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingTitles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifiers.settingsCell)
        cell?.textLabel?.text = settingTitles[indexPath.row] // Set title of cell
        cell?.backgroundColor = Colors.clear // Clear background
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Selected: \(settingTitles[indexPath.row])") // Feedback
        let profile = 0
        
        switch indexPath.row {
        case profile:
            performSegueWithIdentifier(SegueIdentifiers.SettingsToProfile, sender: nil)
            break
        default:
            break
        }
    }
    
    func adjustForScreenSizes() {
        
        if DeviceTypes.iPhone5 || DeviceTypes.iPhone4 || DeviceTypes.iPhone6Zoomed {
            // Change constraint constants, etc. here for these smaller device screens
            
        } else if DeviceTypes.iPad {
            
        } else {
            
        }
        
        view.layoutIfNeeded() // Refresh screen
    }
    
}