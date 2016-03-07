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

    //Initialize the outlets from the Storyboard
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    //Set the schoolInfos var to SchoolData class
    var profileInfos = [ProfileData]()
    let loadData = (UIApplication.sharedApplication().delegate as! AppDelegate).loadData as LoadData

    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        //This allows us to get the schoolInfos Data that is in LoadData class!
        self.profileInfos = loadData.profileInfos
        
        self.load_image((self.profileInfos[0].imageURL), imageLabel: profilePicture)
        
        nameLabel.text = self.profileInfos[0].username
   //     emailLabel.text = self.profileInfos[0].userEmail
   //     idLabel.text = self.profileInfos[0].facebookid
        genderLabel.text = self.profileInfos[0].gender
        ageLabel.text = self.profileInfos[0].birthday

        
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

    //Function that will load the Profile Image
    func load_image(urlString:String, imageLabel: UIImageView) {
        //Set the image frame
        imageLabel.layer.borderWidth = 1
        imageLabel.layer.masksToBounds = false
        imageLabel.layer.borderColor = UIColor.blackColor().CGColor
        imageLabel.layer.cornerRadius = imageLabel.frame.height/2
        imageLabel.clipsToBounds = true
        
        let imgURL: NSURL = NSURL(string: urlString)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if (error == nil && data != nil) {
                func display_image() {
                    imageLabel.image = UIImage(data: data!)
                }
                dispatch_async(dispatch_get_main_queue(), display_image)
            }
        }
        task.resume()
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
  
}
