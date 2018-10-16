//
//  NSObject+ClassDefinition.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 16.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Foundation

extension NSObject {
    static func nameOfClass() -> String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
