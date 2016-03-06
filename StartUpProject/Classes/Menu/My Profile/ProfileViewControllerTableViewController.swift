//
//  ProfileViewController.swift
//  StartUpProject
//
//  Created by Romain on 01/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class ProfileViewController: UITableViewController {

    //Set the schoolInfos var to SchoolData class
    var profileInfos = [ProfileData]()
    var profileTV = ProfileTV()
    let loadData = (UIApplication.sharedApplication().delegate as! AppDelegate).loadData as LoadData

    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        //This allows us to get the schoolInfos Data that is in LoadData class!
        
        dispProfileInfos()
        
        //Check if the Sidebar is active
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = "revealToggle:"
            
            //Enable the Gestures and prevent from selecting a cell
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            view.removeGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            
            //Set the title
            title = "Profile Page"
        }
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    
    func dispProfileInfos() {
        self.profileInfos = loadData.profileInfos


        

    }
    
}
