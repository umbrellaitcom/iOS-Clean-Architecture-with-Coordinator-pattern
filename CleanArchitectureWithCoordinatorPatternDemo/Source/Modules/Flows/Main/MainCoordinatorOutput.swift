//
//  MainCoordinatorOutput.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 11.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Foundation

protocol MainCoordinatorOutput: class {
    var finishFlow: CompletionBlock? { get set }
}
