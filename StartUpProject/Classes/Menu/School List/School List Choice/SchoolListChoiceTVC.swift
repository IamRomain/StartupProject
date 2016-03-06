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
    let loadData = (UIApplication.sharedApplication().delegate as! AppDelegate).loadData as LoadData


    @IBOutlet var menuButton:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This allows us to get the schoolInfos Data that is in LoadData class!
        self.schoolInfos = loadData.schoolInfos
        
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


//Configure the Table View Cell
    //Return the number of sections
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //Return the number of rows in section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.schoolInfos.count
    }
    
    //Display the data in the cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! SchoolListChoiceTVCell
        
        // Configure the cell...
        cell.schoolListNameLabel.text = self.schoolInfos[indexPath.row].name
        cell.schoolListLocationLabel.text = self.schoolInfos[indexPath.row].location
        cell.schoolListTypeLabel.text = self.schoolInfos[indexPath.row].type
        cell.schoolListNumberOfMembersLabel.text = self.schoolInfos[indexPath.row].numberOfMembers
        cell.schoolListLogo.image = self.schoolInfos[indexPath.row].image
        
        return cell
    }
    
    

}


