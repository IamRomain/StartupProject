//
//  ProfileData.swift
//  StartUpProject
//
//  Created by Romain on 06/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit

class ProfileData {
    
    //Initialize the Data
    var facebookid = ""
    var username = ""
    var userEmail = ""
    var gender = ""
    var birthday = ""

    var image:UIImage?=nil
    
    //Set the Data
    init(facebookid:String, username:String, userEmail:String, gender:String, birthday:String) {
        self.facebookid = facebookid
        self.username = username
        self.userEmail = userEmail
        self.gender = gender
        self.birthday = birthday
    }

}
