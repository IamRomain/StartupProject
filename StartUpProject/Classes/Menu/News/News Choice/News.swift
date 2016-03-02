//
//  News.swift
//  StartUpProject
//
//  Created by Romain Soubrane on 01/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit

class News {
   
    //Initialize the Data
    var title = ""
    var type = ""
    var author = ""
    var date = ""
    var time = ""
    var image: UIImage? = nil
    
    init(title: String, type: String, author: String, date: String, time: String, image: String) {
        self.title = title
        self.type = type
        self.author = author
        self.date = date
        self.time = time
        
        //Retrieve the picture
        let imgURL: NSURL = NSURL(string: "http://kuzco.fr/data/images/events/icon/partoutatease.jpg")!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            //If we receive data, display it
            if (error == nil && data != nil) {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
