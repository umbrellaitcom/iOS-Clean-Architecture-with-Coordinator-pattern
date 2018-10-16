//
//  SeriesItem.swift
//  Marvel
//
//  Created by Максим on 06.09.16.
//  Copyright © 2016 Максим. All rights reserved.
//

import Foundation
import ObjectMapper

struct SeriesItem {
    
    var name = ""
    var resourceURI = ""
    
}

// MARK:- BaseMappable
extension SeriesItem: Mappable {
    
    mutating func mapping(map: Map) {
        name        <- map["name"]
        resourceURI <- map["resourceURI"]
    }
    
    init?(map: Map) {}

}
