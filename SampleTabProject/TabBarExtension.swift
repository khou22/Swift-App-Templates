//
//  TabBarExtension.swift
//  SampleTabProject
//
//  Created by Breathometer on 8/4/16.
//  Copyright © 2016 KevinHou. All rights reserved.
//

import UIKit

class CustomTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupMiddleButton()
    }
    
    func setupMiddleButton() {
        
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = self.view.bounds.height - menuButtonFrame.height
        menuButtonFrame.origin.x = self.view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame
        
        menuButton.backgroundColor = UIColor.lightGrayColor()
        menuButton.layer.cornerRadius = menuButtonFrame.height/2
        
        menuButton.setImage(UIImage(named: "white-geo-flame"), forState: UIControlState.Normal)
        menuButton.contentMode = .ScaleAspectFit
        menuButton.addTarget(self, action: #selector(CustomTabController.menuButtonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(menuButton)
        
        self.view.layoutIfNeeded()
    }
    
    func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2
    }
}
