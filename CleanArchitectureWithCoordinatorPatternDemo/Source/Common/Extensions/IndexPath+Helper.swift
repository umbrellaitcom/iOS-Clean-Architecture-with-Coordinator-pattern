//
//  IndexPath+Helper.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 28.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Foundation

extension IndexPath {
    static func configure<T,V>(for anyValues: [T], with previusValues: [V], section: Int) -> [IndexPath] {
        let from = !previusValues.isEmpty ? previusValues.count - anyValues.count : 0
        let newIndexPaths: [IndexPath] = (from...previusValues.count - 1).map { IndexPath(item: $0, section: section) }
        return newIndexPaths
    }
}
