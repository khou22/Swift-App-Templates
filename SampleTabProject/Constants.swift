//
//  Constants.swift
//  SampleTabProject
//
//  Created by Breathometer on 8/4/16.
//  Copyright © 2016 KevinHou. All rights reserved.
//
//  Reference: http://khou22.github.io/programming/2016/07/20/xcode-best-practices-july-2016-troubleshooting-pull-requests-and-more.html

import Foundation
import UIKit

struct Colors {
    // Project colors
    static let red                          = UIColor(red: 213.0/255.0, green: 73.0/255.0, blue: 31.0/255.0, alpha: 1.0)
    static let orange                       = UIColor(red: 218.0/255.0, green: 141.0/255.0, blue: 15.0/255.0, alpha: 1.0)
    static let green                        = UIColor(red: 128.0/255.0, green: 164.0/255.0, blue: 84.0/255.0, alpha: 1.0)
    static let blue                         = UIColor(red: 50.0/255.0, green: 134.0/255.0, blue: 168.0/255.0, alpha: 1.0)
    static let grey                         = UIColor(red: 157.0/255.0, green: 183.0/255.0, blue: 193.0/255.0, alpha: 1.0)
    static let white                        = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    static let black                        = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
    static let clear                        = UIColor.clearColor()
}

struct Files {
    // Useful for movie files
}

struct Images {
    // Image names
    static let tabBarFire                   = "white-geo-flame"
}

struct Storyboard {
    // Storyboard identifiers
    static let favorites                    = "favoritesStoryboardScreen"
    static let historyPageOne               = "historyPageOne"
    static let historyPageTwo               = "historyPageTwo"
    static let historyPageThree             = "historyPageThree"
}

struct CellIdentifiers {
    // Table view cell identifiers
    static let settingsCell                 = "SettingsCell"
    static let collectionCell               = "NameCell"
}

struct SegueIdentifiers {
    // Segue identifiers
    static let SettingsToProfile                   = "SettingsToProfile"
}

struct SDK {
    // SDK Keys
    static let sdkAppID                     = "random"
}

struct Constants {
    // NSUserDefaults initializer
    static let defaults                     = NSUserDefaults.standardUserDefaults()
}

struct Keys {
    // NSUserDefault keys:
    static let favoriteContacts             = "favoriteContacts"
    
    // Other keys
}

struct Urls {
    // URLs
    static let personalWebsite              = "https://khou22.github.io"
}

struct ScreenSize {
    // Phone screen size
    static let screen_width                 = UIScreen.mainScreen().bounds.size.width
    static let screen_height                = UIScreen.mainScreen().bounds.size.height
    static let screen_max_length            = max(ScreenSize.screen_width, ScreenSize.screen_height)
    static let screen_min_length            = min(ScreenSize.screen_width, ScreenSize.screen_height)
}

struct DeviceTypes {
    // Device type (useful for constraints)
    static let iPhone4                      = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.screen_max_length < 568.0
    static let iPhone5                      = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.screen_max_length == 568.0
    static let iPhone6Standard              = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.screen_max_length == 667.0 && UIScreen.mainScreen().nativeScale == UIScreen.mainScreen().scale
    static let iPhone6Zoomed                = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.screen_max_length == 667.0 && UIScreen.mainScreen().nativeScale > UIScreen.mainScreen().scale
    static let iPhone6PlusStandard          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.screen_max_length == 736.0
    static let iPhone6PlusZoomed            = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.screen_max_length == 736.0 && UIScreen.mainScreen().nativeScale < UIScreen.mainScreen().scale
    static let iPad                         = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.screen_max_length == 1024.0
}
