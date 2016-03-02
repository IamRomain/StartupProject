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

    //Link the Labels with the Storyboard
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    //Initialize the Labels
    var facebookid : String!
    var username : String!
    var userEmail : String!
    var gender : String!
    var birthday : String!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        returnUserData()

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
    

    //Return the Data
    func returnUserData() {
            
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath:  "me", parameters: ["fields":"email, name, gender, birthday"])
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
        if ((error) != nil) {
        // Process error
        print("Error: \(error)")
        } else {
            self.facebookid = (result.valueForKey("id") as? String)!
            self.username = (result.valueForKey("name") as? String)!
            self.userEmail = (result.valueForKey("email") as? String)!
            self.gender = (result.valueForKey("gender") as? String)!
            self.birthday = (result.valueForKey("birthday") as? String)!
        
            self.nameLabel.text = self.username
            //self.emailLabel.text = self.userEmail
            //self.idLabel.text = self.facebookid
            self.genderLabel.text = self.gender
            self.ageLabel.text = self.birthday
        
            self.load_image("https://graph.facebook.com/\(self.facebookid)/picture?type=large", imageLabel: self.profilePicture)
            }
        })
    }
    
    //Function that will load the Profile Image
    func load_image(urlString:String, imageLabel: UIImageView) {
        let imgURL: NSURL = NSURL(string: urlString)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
    
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
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
