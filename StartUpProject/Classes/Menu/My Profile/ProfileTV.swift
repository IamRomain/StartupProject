//
//  ProfileTV.swift
//  StartUpProject
//
//  Created by Romain on 06/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit

class ProfileTV: UIViewController {
    
    var profileInfos = [ProfileData]()
    let loadData = (UIApplication.sharedApplication().delegate as! AppDelegate).loadData as LoadData
    
    //Initialize the outlets from the Storyboard
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    @IBOutlet weak var profilePicture: UIImageView!
    
    func dispData() {
        //This allows us to get the schoolInfos Data that is in LoadData class!
        self.profileInfos = loadData.profileInfos
        
        nameLabel.text = self.profileInfos[0].username
        emailLabel.text = self.profileInfos[0].userEmail
        idLabel.text = self.profileInfos[0].facebookid
        genderLabel.text = self.profileInfos[0].gender
        ageLabel.text = self.profileInfos[0].birthday
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
