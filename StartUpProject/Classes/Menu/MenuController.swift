//
//  MenuController.swift
//  StartUpProject
//
//  Created by Romain Soubrane on 01/03/2016.
//  Copyright © 2016 Romain Soubrane. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //This permits to unselect the previously selected cell when going back to table view
        let indexPath = self.tableView.indexPathForSelectedRow
        if (indexPath != nil) {
            self.tableView.deselectRowAtIndexPath(indexPath!, animated: animated)
        }
    }

}
