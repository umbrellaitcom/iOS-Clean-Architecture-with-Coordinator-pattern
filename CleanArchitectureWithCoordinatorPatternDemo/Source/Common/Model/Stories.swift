//
//  Stories.swift
//  Marvel
//
//  Created by Максим on 06.09.16.
//  Copyright © 2016 Максим. All rights reserved.
//

import Foundation
import ObjectMapper

struct Stories {
    
    var available     : Int?
    var collectionURI = ""
    var storiesItems  : [StoriesItem]?
}

// MARK:- BaseMappable
extension Stories: Mappable {
    
    mutating func mapping(map: Map) {
        available     <- map["available"]
        collectionURI <- map["collectionURI"]
        storiesItems  <- map["items"]
    }
    
    init?(map: Map) {}

}
