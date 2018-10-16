//
//  Constants.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 16.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Foundation

// MARK:- Typealiases
typealias CompletionBlock      = ()       -> Void
typealias AlertCompletionBlock = (String) -> Void

// MARK:- Storyboards enum
enum Storyboards: String {
    
    case authorization = "Auth"
    case main          = "Main"
    case onboarding    = "Onboarding"
    
}

// MARK:- PersistantKeys enum
enum PersistantKeys {
    
    static let isSeenOnboarding = "kIsSeenOnboarding"
    static let token            = "kToken"
    
}

enum Urls {
    static let base = "http://gateway.marvel.com"
    
    enum Endpoints {
        static let characters = "/v1/public/characters"
    }
    
    static let timestamp: NSNumber = 1
}

enum ApiKeys {
    static let publicKey  = "44c6606f72114e4a9eaf84cb93fb8863"
    static let privateKey = "a92b6b3b8140846adf4eeebb64d576b5570be727"
}

// MARK:- Erroring
enum ErrorCode: Int {
    case nilResponse   = -11
    case emptyResponse = -10
    case undefined     = -1
}
