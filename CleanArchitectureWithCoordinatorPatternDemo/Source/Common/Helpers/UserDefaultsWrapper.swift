//
//  UserDefaultsWrapper.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 11.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Foundation

struct UserDefaultsWrapper {
    
    fileprivate static let UserDefaultsStandart = UserDefaults.standard
    
    static var isSeenOnboarding: Bool {
        get {
            return UserDefaultsStandart.bool(forKey: PersistantKeys.isSeenOnboarding)
        }
        set {
            UserDefaultsStandart.set(newValue, forKey: PersistantKeys.isSeenOnboarding)
            UserDefaultsStandart.synchronize()
        }
    }
    
    static var token: String? {
        get {
            return UserDefaultsStandart.string(forKey: PersistantKeys.token)
        }
        set {
            UserDefaultsStandart.set(newValue, forKey: PersistantKeys.token)
            UserDefaultsStandart.synchronize()
        }
    }
    
}
