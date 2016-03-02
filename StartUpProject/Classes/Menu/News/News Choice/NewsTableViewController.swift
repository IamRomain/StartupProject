//
//  NewsTableViewController.swift
//  StartUpProject
//
//  Created by Romain Soubrane on 01/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class NewsTableViewController: UITableViewController {

    var newsInfos = [News]()
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Retrieve the Data from AppDelegate
        self.newsInfos = (UIApplication.sharedApplication().delegate as! AppDelegate).newsInfos
        
        //Check if the Sidebar is active
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = "revealToggle:"
            
            //Enable the Gestures and prevent from selecting a cell
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            view.removeGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            
            //Launch the Walkthrough
            displayWalkthroughs()
            
            //Set the title
            title = "News"
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Hide the navigation bar if the Sidebar is on
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        //This permits to unselect the previously selected cell when going back to table view
        let indexPath = self.tableView.indexPathForSelectedRow
        if (indexPath != nil) {
            self.tableView.deselectRowAtIndexPath(indexPath!, animated: animated)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//Configure the Table View Cell
    
    //Return the number of sections
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Return the number of rows in section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsInfos.count
    }
    
    //Display the data in the cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NewsTableViewCell
        
        //Configure the cell
        cell.newsNameLabel.text = self.newsInfos[indexPath.row].title
        cell.newsTypeLabel.text = self.newsInfos[indexPath.row].type
        cell.newsAuthorLabel.text = self.newsInfos[indexPath.row].author
        cell.newsDateLabel.text = self.newsInfos[indexPath.row].date
        cell.newsTimeLabel.text = self.newsInfos[indexPath.row].time
        cell.newsImage.image = self.newsInfos[indexPath.row].image
        return cell
    }
    
    //Function that will launch the walkthrough
    func displayWalkthroughs() {
        //Instantiate the Key to check if the walkthrough has already been displayed
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let displayedWalkthrough = userDefaults.boolForKey("DisplayedWalkthrough")
        
        //If it hasn't been shown, display the walkthrough
        if !displayedWalkthrough {
            if let pageViewController = storyboard?.instantiateViewControllerWithIdentifier("WalkthroughPageViewController") as? WalkthroughPageViewController {
                self.presentViewController(pageViewController, animated: true, completion: nil)
            }
        }
        
    }
}















