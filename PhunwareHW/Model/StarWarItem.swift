//
//  FeedItem.swift
//  PhunwareHW
//
//  Created by Anjana on 3/13/16.
//  Copyright © 2016 Phunware. All rights reserved.
//

import UIKit
import ObjectMapper

class StarWarItem: Mappable {
    var itemDescription: String?
    var title: String?
    var image: String?
    var locationLine1: String?
    var locationLine2: String?
    var phone: String?
    var date: String?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        itemDescription <- map["description"]
        title <- map["title"]
        image <- map["image"]
        locationLine1 <- map["locationline1"]
        locationLine2 <- map["locationline2"]
        phone <- map["phone"]
        date <- map["date"]
    }
}
