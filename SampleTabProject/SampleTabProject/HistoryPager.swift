//
//  HistoryPager.swift
//  SampleTabProject
//
//  Created by Breathometer on 8/4/16.
//  Copyright © 2016 KevinHou. All rights reserved.
//
// http://khou22.github.io/programming/2016/06/28/making-a-simple-page-based-application-in-swift.html

import Foundation
import UIKit

class HistoryPager: UIPageViewController {
    
    func getPageOne() -> HistoryPageOne {
        // Retrieve the view
        return storyboard!.instantiateViewControllerWithIdentifier(Storyboard.historyPageOne) as! HistoryPageOne
    }
    
    func getPageTwo() -> HistoryPageTwo {
        // Retrieve the view
        return storyboard!.instantiateViewControllerWithIdentifier(Storyboard.historyPageTwo) as! HistoryPageTwo
    }
    
    func getPageThree() -> HistoryPageThree {
        // Retrieve the view
        return storyboard!.instantiateViewControllerWithIdentifier(Storyboard.historyPageThree) as! HistoryPageThree
    }
    
    override func viewDidLoad() {
        setViewControllers([getPageOne()], direction: .Forward, animated: false, completion: nil) // First screen
        dataSource = self // Refers to the Pager extension of type UIPageViewControllerDataSource
        view.backgroundColor = Colors.blue
    }
}

extension HistoryPager: UIPageViewControllerDataSource {
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        // Swiping forward
        
        if viewController.isKindOfClass(HistoryPageOne) { // If you're on page one
            // We want to swipe to page two
            return getPageTwo()
        } else if viewController.isKindOfClass(HistoryPageTwo) { // If on page two
            // End of all pages
            return getPageThree()
        } else { // If on page three
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        // Swiping backward
        
        if viewController.isKindOfClass(HistoryPageThree) {
            // If on page three, can swipe back to page two
            return getPageTwo()
        } else if viewController.isKindOfClass(HistoryPageTwo) {
            return getPageOne()
        } else {
            // If on the first page, can't swipe back
            return nil
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        // On the first dot when you first load the OnboardingPager
        // Swift automatically handles switching pages and updating the page control dots
        // Updates when setViewControllers is called
        return 0
    }
}