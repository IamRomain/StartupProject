//
//  Settings.swift
//  StartUpProject
//
//  Created by Romain on 02/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class Settings: UIViewController {
    
    @IBOutlet weak var menuButton:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
    
    //Function to reset the data when Button is clicked
    @IBAction func resetData(sender: AnyObject) {
        resetDisplayWalkthroughs()
        let loginManager = FBSDKLoginManager()
        loginManager.logOut()
    }
    

    //Func to reset the Walkthrough
    func resetDisplayWalkthroughs() {
    
        // Force to reset the walkthroughs
        _ = NSUserDefaults.standardUserDefaults()
        let displayedWalkthrough = false
        
        //Reset the Key
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(false, forKey: "DisplayedWalkthrough")
    
        // let's show them
        if !displayedWalkthrough {
            // instantiate neew PageVC via storyboard
            if let pageViewController = storyboard?.instantiateViewControllerWithIdentifier("WalkthroughPageViewController") as? WalkthroughPageViewController {
                self.presentViewController(pageViewController, animated: true, completion: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}