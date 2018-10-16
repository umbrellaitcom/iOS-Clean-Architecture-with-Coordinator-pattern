//
//  Session.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 16.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Foundation

typealias Credentials = (username: String, password: String)

struct Session {
    static var isAuthorized: Bool {
        return UserDefaultsWrapper.token != nil
    }
    
    static var isSeenOnboarding: Bool {
        get {
            return UserDefaultsWrapper.isSeenOnboarding
        }
        set {
            UserDefaultsWrapper.isSeenOnboarding = newValue
        }
    }
}
