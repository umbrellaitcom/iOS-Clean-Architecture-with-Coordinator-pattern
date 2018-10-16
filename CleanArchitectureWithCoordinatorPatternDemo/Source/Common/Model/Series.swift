//
//  Series.swift
//  Marvel
//
//  Created by Максим on 06.09.16.
//  Copyright © 2016 Максим. All rights reserved.
//

import Foundation
import ObjectMapper

struct Series {
    
    var available     : Int?
    var collectionURI = ""
    var seriesItems   : [SeriesItem]?

}

// MARK:- BaseMappable
extension Series: Mappable {
    
    mutating func mapping(map: Map) {
        available     <- map["available"]
        collectionURI <- map["collectionURI"]
        seriesItems   <- map["items"]
    }
    
    init?(map: Map) {}

}
