//
//  StoriesIrem.swift
//  Marvel
//
//  Created by Максим on 06.09.16.
//  Copyright © 2016 Максим. All rights reserved.
//

import Foundation
import ObjectMapper

struct StoriesItem {
    
    var name        = ""
    var resourceURI = ""
    var type        = ""
    
}

// MARK:- BaseMappable
extension StoriesItem: Mappable {
    
    mutating func mapping(map: Map) {
        name        <- map["name"]
        resourceURI <- map["resourceURI"]
        type        <- map["type"]
    }
    
    init?(map: Map) {}

}
