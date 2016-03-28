//
//  WalkthroughPageViewController.swift
//  StartUpProject
//
//  Created by Romain Soubrane on 01/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit

//Instantiate the walkthrough
class WalkthroughPageViewController: UIPageViewController {

    //Set the data for the Walkthrough (Will set this on internet later on)
    var pageHeaders = ["Meet up with other students","Party like never before","Compete with others","Enter the unique experience"]
    var pageImages = ["BGTuto1","BGTuto2","BGTuto3","BGTuto4"]
    var pageDescriptions = ["Participate in several sportive or Social Events.", "Experience Parties in a new way with epic challenges.", "Face others and prove to everyone that you and your school are the best", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set the Page View Controller data source
        self.dataSource = self
        
        //Create the first walkthrough view controller
        if let startWalkthroughVC = self.viewControllerAtIndex(0) {
            setViewControllers([startWalkthroughVC], direction: .Forward, animated: true, completion: nil)
        }
    }
    
//Set the classes for navigation
    //Set the next Page
    func nextPageWithIndex(index: Int) {
        if let nextWalkthroughVC = self.viewControllerAtIndex(index + 1) {
            setViewControllers([nextWalkthroughVC], direction: .Forward, animated: true, completion: nil)
        }
    }
    
    //Controller for the Page Index
    func viewControllerAtIndex(index: Int) -> WalkthroughViewController? {
        if index == NSNotFound || index < 0 || index >= self.pageDescriptions.count {
            return nil
        }
    
    
        //Create the Walkthrough and assign the matching data to WalkthroughViewController Class
        if let walkthroughViewController = storyboard?.instantiateViewControllerWithIdentifier("WalkthroughViewController") as? WalkthroughViewController {
            walkthroughViewController.headerText = pageHeaders[index]
            walkthroughViewController.imageName = pageImages[index]
            walkthroughViewController.descriptionText = pageDescriptions[index]
            walkthroughViewController.index = index
            
            return walkthroughViewController
        }
        return nil
    }
}

//Delegate the DataSource of this Page Class
extension WalkthroughPageViewController : UIPageViewControllerDataSource {
    
    //Set the Page Index for a Swipe on next page
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! WalkthroughViewController).index
        index += 1
        return self.viewControllerAtIndex(index)
    }
    
    //Set the Page Index for a Swipe on previous page
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughViewController).index
        index -= 1
        return self.viewControllerAtIndex(index)
    }
}
