//
//  AppDelegate.swift
//  StartUpProject
//
//  Created by Romain Soubrane on 01/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Alamofire
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //Initialize the news data infos
    internal var newsInfos = [News]()
    internal var schoolInfos = [SchoolData]()
    internal var profileInfos = [ProfileData]()
    
    //Initialize the loadData object assigned to the LoadData class
    internal var loadData = LoadData()
    
    var window: UIWindow?
        
        func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
            // Override point for customization after application launch.
    
            //This allows to launch the function in LoadData Class, that will get all the data
            loadData.loadEverything()
            
            //Set the app colors
            window!.tintColor = UIColor(red: 252/255, green: 72/255, blue: 49/255, alpha: 1)
            UINavigationBar.appearance().tintColor = UIColor.blackColor()
            UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.blackColor()]
            
            //Make the status bar white (light content)
            func preferredStatusBarStyle() -> UIStatusBarStyle {
                return .LightContent
            }
            
            //Call the class LoadData to load everything before the launch of the app
            
            //Set the font and size
            if let barFont = UIFont(name: "Avenir-Light", size: 24.0) {
                UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.blackColor(), NSFontAttributeName:barFont]
            }
            
            //Needed to initialize FB Button
            FBSDKLoginButton.classForCoder()

            return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
            return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
        }
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
