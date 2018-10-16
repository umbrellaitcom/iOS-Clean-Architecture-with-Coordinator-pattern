//
//  Comics.swift
//  Marvel
//
//  Created by Максим on 06.09.16.
//  Copyright © 2016 Максим. All rights reserved.
//

import Foundation
import ObjectMapper

struct Comics {
  
    var available     : Int?
    var collectionURI = ""
    var comicsItems   : [ComicsItem]?
}

// MARK:- BaseMappable
extension Comics: Mappable {
    
    mutating func mapping(map: Map) {
        available     <- map["available"]
        collectionURI <- map["collectionURI"]
        comicsItems   <- map["items"]
    }
    
    init?(map: Map) {}

}

