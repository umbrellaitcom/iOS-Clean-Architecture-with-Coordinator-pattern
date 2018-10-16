//
//  AuthorizationCoordinator.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 17.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

final class AuthorizationCoordinator: BaseCoordinator, AuthorizationCoordinatorOutput {
    
    var finishFlow: CompletionBlock?
    
    fileprivate let factory: AuthorizationFactoryProtocol
    fileprivate let router : Routable
    
    init(with factory: AuthorizationFactoryProtocol, router: Routable) {
        self.factory = factory
        self.router  = router
    }
}

// MARK:- Coordinatable
extension AuthorizationCoordinator: Coordinatable {
    func start() {
        performFlow()
    }
}

// MARK:- Private methods
private extension AuthorizationCoordinator {
    func performFlow() {
        let view = factory.makeEnterView()
        view.onCompletion = finishFlow
        router.setRootModule(view, hideBar: true)
    }
}
