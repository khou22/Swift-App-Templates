//
//  SecondViewController.swift
//  SampleTabProject
//
//  Created by Breathometer on 8/3/16.
//  Copyright © 2016 KevinHou. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        adjustForScreenSizes() // Adjust formatting for screen size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

