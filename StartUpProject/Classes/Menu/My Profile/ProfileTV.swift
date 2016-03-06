//
//  ProfileTV.swift
//  StartUpProject
//
//  Created by Romain on 06/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit

class ProfileTV: UIView {
    
    //Initialize the outlets from the Storyboard
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    @IBOutlet weak var profilePicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
