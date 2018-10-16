//
//  NSError+Creation.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 23.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Foundation

public extension NSError {
    
    public static func error(title: String, code: Int) -> NSError {
        let bundleName =  Bundle.main.bundleIdentifier!
        return NSError(domain: bundleName, code: code, userInfo: [NSLocalizedDescriptionKey : title])
    }
    
    public static func error(title: String) -> NSError {
        return error(title: title, code: 0)
    }
}

extension NSError {
    static func error(title: String, code: ErrorCode) -> NSError {
        return NSError.error(title: title, code: code.rawValue)
    }
}
