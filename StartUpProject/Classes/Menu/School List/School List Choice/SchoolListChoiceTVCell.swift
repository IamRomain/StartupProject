//
//  SchoolListChoiceTVCell.swift
//  StartUpProject
//
//  Created by Romain on 05/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit

class SchoolListChoiceTVCell: UITableViewCell {
    
    //Initialize the outlets from the Storyboard
    @IBOutlet weak var schoolListNameLabel: UILabel!
    @IBOutlet weak var schoolListLocationLabel: UILabel!
    @IBOutlet weak var schoolListNumberOfMembersLabel: UILabel!
    @IBOutlet weak var schoolListTypeLabel: UILabel!
    @IBOutlet weak var schoolListLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        //Set the selected state
        super.setSelected(selected, animated: animated)
    }
}
