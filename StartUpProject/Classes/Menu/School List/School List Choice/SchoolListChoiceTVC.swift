//
//  SchoolListChoiceTVC.swift
//  StartUpProject
//
//  Created by Romain on 05/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit

class SchoolListChoiceTVC: UITableViewController {
    
    //Set the schoolInfos var to SchoolData class
    var schoolInfos = [SchoolData]()

    @IBOutlet var menuButton:UIBarButtonItem!
    
    override func viewDidLoad() {
        //This allows us to get the schoolInfos Data that is in LoadData class!
        self.schoolInfos = (UIApplication.sharedApplication().delegate as! LoadData).schoolInfos
        
        //Check if the Sidebar is active
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = "revealToggle:"
            
            //Enable the Gestures and prevent from selecting a cell
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            view.removeGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            
            //Set the title
            title = "School List"
        }
    }

    override func viewWillAppear(animated: Bool) {
            
//Hide the navigation bar if the Sidebar is on
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        //This permits to unselect the previously selected cell when going back to table view
        let indexPath = self.tableView.indexPathForSelectedRow
        if (indexPath != nil) {
            self.tableView.deselectRowAtIndexPath(indexPath!, animated: animated)
        }
    }




}


