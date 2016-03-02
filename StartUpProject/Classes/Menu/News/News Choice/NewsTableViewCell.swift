//
//  NewsTableViewCell.swift
//  StartUpProject
//
//  Created by Romain on 01/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    //Initialize the Labels
    @IBOutlet weak var newsNameLabel: UILabel!
    @IBOutlet weak var newsTypeLabel: UILabel!
    @IBOutlet weak var newsAuthorLabel: UILabel!
    @IBOutlet weak var newsDateLabel: UILabel!
    @IBOutlet weak var newsTimeLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
