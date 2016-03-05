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

public class LoadData {


    func getData(completion:(Bool)->()) {
        Alamofire.request(.GET, "http://kuzco.fr/api/ecoles.php", parameters: ["adresse": "location", "categorie": "categorie", "eleves": "eleves", "logo": "logo", "nom": "name"]).responseJSON { response in
            
            let jsonArray = JSON(data:response.data!)
            
            for (_, schoolData) in jsonArray {
                let school = Schools(name: schoolData["nom"].stringValue, type: schoolData["categorie"].stringValue, location: schoolData["adresse"].stringValue, numberOfMembers: schoolData["eleves"].stringValue, image: schoolData["logo"].stringValue)
                self.schoolInfos.append(school)
            }
            completion(true)
        }
    
}
