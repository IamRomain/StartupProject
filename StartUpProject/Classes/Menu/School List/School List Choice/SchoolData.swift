//
//  SchoolData.swift
//  StartUpProject
//
//  Created by Romain on 05/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit

class SchoolData {
    
    //Initialize the Data
    var name = ""
    var type = ""
    var location = ""
    var numberOfMembers = ""
    var image:UIImage?=nil
    
    //Set the Data
    init(name:String, type:String, location:String, numberOfMembers:String, image:String) {
        self.name = name
        self.type = type
        self.location = location
        self.numberOfMembers = numberOfMembers
        let imgURL: NSURL = NSURL(string: "http://kuzco.fr/data/images/ecoles/logo/\(image).png")!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            if (error == nil && data != nil) {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
