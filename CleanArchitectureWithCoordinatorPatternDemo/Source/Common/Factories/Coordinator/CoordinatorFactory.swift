//
//  CoordinatorFactory.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 16.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

final class CoordinatorFactory {
    fileprivate let modulesFactory = ModulesFactory()
}

// MARK:- CoordinatorFactoryProtocol
extension CoordinatorFactory: CoordinatorFactoryProtocol {
    func makeOnboardingCoordinator(router: Routable) -> Coordinatable & OnboardingCoordinatorOutput {
        return OnboardingCoordinator(with: modulesFactory, router: router)
    }
    
    func makeAuthorizationCoordinator(router: Routable) -> AuthorizationCoordinatorOutput & Coordinatable {
        return AuthorizationCoordinator(with: modulesFactory, router: router)
    }
    
    func makeMainCoordinator(router: Routable) -> Coordinatable & MainCoordinatorOutput {
        return MainCoordinator(with: modulesFactory, router: router)
    }
}

// MARK:- Private methods
private extension CoordinatorFactory {
    func router(_ navController: UINavigationController?, in storyboard: Storyboards) -> Routable {
        return Router(rootController: navigationController(navController, in: storyboard))
    }
    
    func navigationController(_ navController: UINavigationController?, in storyboard: Storyboards) -> UINavigationController {
        return navController == nil ? UINavigationController.controllerFromStoryboard(storyboard) : navController!
    }
}
