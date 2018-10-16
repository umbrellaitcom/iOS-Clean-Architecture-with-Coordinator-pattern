//
//  EnterViewProtocol.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 11.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

protocol EnterViewProtocol: BaseViewProtocol {
    var onCompletion: CompletionBlock? { get set }
}

