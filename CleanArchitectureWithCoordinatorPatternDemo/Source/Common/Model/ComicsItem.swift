//
//  ComicsItem.swift
//  Marvel
//
//  Created by Максим on 06.09.16.
//  Copyright © 2016 Максим. All rights reserved.
//

import Foundation
import ObjectMapper

struct ComicsItem {
    
    var name        = ""
    var resourceURI = ""

}

extension ComicsItem: Mappable {

    mutating func mapping(map: Map) {
        name        <- map["name"]
        resourceURI <- map["resourceURI"]
    }
    
    init?(map: Map) {}

}
