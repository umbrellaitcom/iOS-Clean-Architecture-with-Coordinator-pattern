//
//  EnterInteractor.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 11.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

final class EnterInteractor {

    weak var presenter: EnterPresenter?
    
    func signIn() {
        UserDefaultsWrapper.token = "Some token"
        presenter?.handleSuccessSignIn()
    }
}
