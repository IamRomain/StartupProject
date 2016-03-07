//
//  LoadData.swift
//  StartUpProject
//
//  Created by Romain on 05/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import FBSDKCoreKit
import FBSDKLoginKit

public class LoadData: NSObject {
    
    var schoolInfos = [SchoolData]()
    var profileInfos = [ProfileData]()
    
    //Function to load all the Data
    func loadEverything() {
        self.getSchoolListData(){ _ in }
    }
    
    //This is the function to get the School List Data
    func getSchoolListData(completion:(Bool)->()) {
        Alamofire.request(.GET, "http://kuzco.fr/api/ecoles.php", parameters: ["adresse": "location", "categorie": "categorie", "eleves": "eleves", "logo": "logo", "nom": "name"]).responseJSON { response in
            
            let jsonArray = JSON(data:response.data!)
            
            for (_, schoolData) in jsonArray {
                let school = SchoolData(name: schoolData["nom"].stringValue, type: schoolData["categorie"].stringValue, location: schoolData["adresse"].stringValue, numberOfMembers: schoolData["eleves"].stringValue, image: schoolData["logo"].stringValue)
                self.schoolInfos.append(school)
            }
            completion(true)
        }
    }
    

    //This is the function to get the Profile Data
    func getProfileData() {
            let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath:  "me", parameters: ["fields":"email, name, gender, birthday"])
            graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
                
                if ((error) != nil) {
                    // Process error
                    print("Error: \(error)")
                } else {
                    let profile = ProfileData(facebookid: (result.valueForKey("id") as! String), username: (result.valueForKey("name") as! String), userEmail: (result.valueForKey("email") as! String), gender: (result.valueForKey("gender") as! String), birthday: (result.valueForKey("birthday") as! String), imageURL: "https://graph.facebook.com/\((result.valueForKey("id") as! String))/picture?type=large")
                    self.profileInfos.append(profile)
                    
  //                  self.load_image(profile.imageURL, imageLabel: (ProfileViewController().profilePicture)!)

        
                }
            })
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
}


