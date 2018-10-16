//
//  OnboardingFactoryProtocol.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 06.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Foundation

protocol OnboardingFactoryProtocol {
    func makeOnboardingView() -> OnboardingViewProtocol
}
