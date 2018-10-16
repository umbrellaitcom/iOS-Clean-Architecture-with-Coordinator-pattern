//
//  Character.swift
//  Marvel
//
//  Created by Максим on 06.09.16.
//  Copyright © 2016 Максим. All rights reserved.
//

import Foundation
import ObjectMapper

struct Character {
    
     var uid         : Int?
     var name        = ""
     var desc        = ""
     var modified    = ""
     var resourceURI = ""
     var comics      : Comics?
     var events      : Events?
     var image       : Thumbnail?
     var series      : Series?
     var stories     : Stories?
     var urls        : [URLS]?
}

// MARK:-
extension Character: Mappable {
    
    mutating func mapping(map: Map) {
        uid         <- map["id"]
        name        <- map["name"]
        desc        <- map["description"]
        modified    <- map["modified"]
        resourceURI <- map["resourceURI"]
        comics      <- map["comics"]
        events      <- map["events"]
        image       <- map["thumbnail"]
        series      <- map["series"]
        stories     <- map["stories"]
        urls        <- map["urls"]
    }
    
    init?(map: Map) {}
    
}




