//
//  RequestManagerErroring.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 23.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Foundation
import ObjectMapper

public protocol RequestManagerErrorMapping: Mappable {
    var code    : Int? { get set }
    var message : String? { get set }
}

public protocol RequestManagerErroring {
    var description: String? { get }
    var errorCode: Int { get }
    func defaultError() -> Self
    func description(code: Int) -> String?
}
