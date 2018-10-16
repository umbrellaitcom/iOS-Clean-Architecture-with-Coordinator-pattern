//
//  AuthorizationCoordinatorOutput.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 17.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

class OnboardingCoordinator: BaseCoordinator, OnboardingCoordinatorOutput {
    
    var finishFlow: CompletionBlock?
    
    private let factory : OnboardingFactoryProtocol
    private let router  : Routable
    
    init(with factory: OnboardingFactoryProtocol, router: Routable) {
        self.factory = factory
        self.router = router
    }
}

// MARK:- Coordinatable
extension OnboardingCoordinator: Coordinatable {
    func start() {
        performOnboarding()
    }
    
    func performOnboarding() {
        let view = factory.makeOnboardingView()
        view.onCompletion = finishFlow
        view.onInfo = { [unowned self] in
            self.router.toPresent?.showAlert(title   : "CREATE AWESOME STUFF WITH THE WORLD'S GREATEST COMIC API!",
                                             message : "The Marvel Comics API allows developers everywhere to access information about Marvel's vast library of comics—from what's coming up, to 70 years ago. ")
        }
        router.setRootModule(view, hideBar: true)
    }
}
