//
//  URLS.swift
//  Marvel
//
//  Created by Максим on 06.09.16.
//  Copyright © 2016 Максим. All rights reserved.
//

import Foundation
import ObjectMapper

struct URLS {
    
    var type = ""
    var url  = ""
}

// MARK:- BaseMappable
extension URLS: Mappable {
    
    mutating func mapping(map: Map) {
        type <- map["type"]
        url  <- map["url"]
    }
    
    init?(map: Map) {}
    
}
