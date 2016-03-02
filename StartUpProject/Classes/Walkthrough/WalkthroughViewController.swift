//
//  WalkthroughViewController.swift
//  StartUpProject
//
//  Created by Romain Soubrane on 01/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

//Configure the Walkthrough
class WalkthroughViewController: UIViewController, FBSDKLoginButtonDelegate {

    //Assign the Storyboard to the Class
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var loginButton: FBSDKLoginButton!
    
    //Set the Data Model for each walkthrough screen
    var index = 0
    var headerText = ""
    var imageName = ""
    var descriptionText = ""
    
    //Configure the Walkthrough with the Data Model
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create the FB Login Button
        loginButton.center = self.view.center
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile","email","user_birthday"]
        
        //Assign the Data to the walkthrough 
        headerLabel.text = headerText
        descriptionLabel.text = descriptionText
        imageView.image = UIImage(named: imageName)
        pageControl.currentPage = index
        
        //Customize the next and login Buttons
        loginButton.hidden = (index == 3) ? false : true
        nextButton.hidden = (index == 3) ? true : false
        loginButton.layer.cornerRadius = 5.0
        loginButton.layer.masksToBounds = true
    }

    //Login button clicked : Set the Walkthrough to "Done" if completed
    @IBAction func loginClicked(sender: AnyObject) {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(true, forKey: "DisplayedWalkthrough")
    }
    
    //Next button clicked : Set the index to + 1
    @IBAction func nextClicked(sender: AnyObject) {
        let WalkthroughViewController = self.parentViewController as! WalkthroughPageViewController
        WalkthroughViewController.nextPageWithIndex(index)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Check if the login is completed
    func loginButton(loginClicked: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if ((error) != nil) {
            //Process in case of an error
        } else if result.isCancelled {
            //Handle the cancellation - Set the Walkthrough to "Not Done"
            let userDefaults = NSUserDefaults.standardUserDefaults()
            userDefaults.setBool(false, forKey: "DisplayedWalkthrough")
        } else {
            //Walkthrough Done : Navigate to main page
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    //Configure the login button
    func loginButtonDidLogOut(loginClicked: FBSDKLoginButton!) {
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
    }
}
