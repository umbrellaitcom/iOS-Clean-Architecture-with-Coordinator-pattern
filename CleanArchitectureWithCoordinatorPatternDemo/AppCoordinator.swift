//
//  AppCoordinator.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 06.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import Foundation

fileprivate enum LaunchInstructor {
    case onboarding, authorization, main
        
    static func setup() -> LaunchInstructor {
        switch (Session.isSeenOnboarding, Session.isAuthorized) {
        case (false, false), (true, false):
            return .authorization
        case (false, true):
            return .onboarding
        case (true, true):
            return .main
        }
    }
}

final class AppCoordinator: BaseCoordinator {
    
    fileprivate let factory: CoordinatorFactoryProtocol
    fileprivate let router : Routable
    
    fileprivate var instructor: LaunchInstructor {
        return LaunchInstructor.setup()
    }
    
    init(router: Routable, factory: CoordinatorFactory) {
        self.router  = router
        self.factory = factory
    }
}

// MARK:- Coordinatable
extension AppCoordinator: Coordinatable {
    func start() {
        switch instructor {
        case .authorization:
            performAuthorizationFlow()
        case .onboarding:
            performOnboarding()
        case .main:
            performMainFlow()
        }
    }
}

// MARK:- Private methods
private extension AppCoordinator {
    func performAuthorizationFlow() {
        let coordinator = factory.makeAuthorizationCoordinator(router: router)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    func performMainFlow() {
        let coordinator = factory.makeMainCoordinator(router: router)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.start()
            self.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    func performOnboarding() {
        let coordinator = factory.makeOnboardingCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            guard
                let `self` = self,
                let `coordinator` = coordinator
                else { return }
            Session.isSeenOnboarding = true
            self.start()
            self.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
}
