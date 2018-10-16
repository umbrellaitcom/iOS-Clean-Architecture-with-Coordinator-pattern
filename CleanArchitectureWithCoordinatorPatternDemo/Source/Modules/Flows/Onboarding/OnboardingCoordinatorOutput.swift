//
//  AuthorizationCoordinatorOutput.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 17.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

protocol OnboardingCoordinatorOutput: class {
    var finishFlow: CompletionBlock? { get set }
}
