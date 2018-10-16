//
//  ModulesFactory.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 17.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

final class ModulesFactory {}

// MARK:- AuthorizationFactoryProtocol
extension ModulesFactory: AuthorizationFactoryProtocol {
    func makeEnterView() -> EnterViewProtocol {
        let view: EnterViewController = EnterViewController.controllerFromStoryboard(.authorization)
        EnterAssembly.assembly(with: view)
        return view
    }
}

// MARK:- OnboardingFactoryProtocol
extension ModulesFactory: OnboardingFactoryProtocol {
    func makeOnboardingView() -> OnboardingViewProtocol {
        let view: OnboardingPageViewController = OnboardingPageViewController.controllerFromStoryboard(.onboarding)
        return view
    }
}

// MARK:- MainFactoryProtocol
extension ModulesFactory: MainFactoryProtocol {
    func makeCharatersView() -> CharactersViewProtocol {
        let view: CharactersViewController = CharactersViewController.controllerFromStoryboard(.main)
        CharactersAssembly.assembly(with: view)
        return view
    }
}

// MARK:- Private methods
private extension ModulesFactory {
    func router(_ navController: UINavigationController?, in storyboard: Storyboards) -> Routable {
        return Router(rootController: navigationController(navController, in: storyboard))
    }
    
    func navigationController(_ navController: UINavigationController?, in storyboard: Storyboards) -> UINavigationController {
        return navController == nil ? UINavigationController.controllerFromStoryboard(storyboard) : navController!
    }
}
