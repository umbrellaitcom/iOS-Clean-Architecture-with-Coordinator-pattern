//
//  Thumbnail.swift
//  Marvel
//
//  Created by Максим on 06.09.16.
//  Copyright © 2016 Максим. All rights reserved.
//

import Foundation
import ObjectMapper

struct Thumbnail {
    
    var path = ""
    var ext = ""
    
}

// MARK:- BaseMappable
extension Thumbnail: Mappable {
    
    mutating func mapping(map: Map) {
        path <- map["path"]
        ext  <- map["extension"]
    }
    
    init?(map: Map) {}

}
