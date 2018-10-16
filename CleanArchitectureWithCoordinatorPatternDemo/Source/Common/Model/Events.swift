//
//  Events.swift
//  Marvel
//
//  Created by Максим on 06.09.16.
//  Copyright © 2016 Максим. All rights reserved.
//

import Foundation
import ObjectMapper

struct Events {
    
    var available     : Int?
    var collectionURI = ""
    var eventsItems   : [EventsItem]?

}

// MARK:- BaseMappable
extension Events: Mappable {
    
    mutating func mapping(map: Map) {
        available     <- map["available"]
        collectionURI <- map["collectionURI"]
        eventsItems   <- map["items"]
    }
    
    init?(map: Map) {}

}
