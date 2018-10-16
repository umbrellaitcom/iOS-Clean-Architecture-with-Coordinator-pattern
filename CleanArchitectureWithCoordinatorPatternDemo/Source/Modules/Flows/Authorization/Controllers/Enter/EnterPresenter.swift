//
//  EnterPresenter.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created Maksim Kazachkov on 10.11.2017.
//  Copyright © 2017 Maksim Kazachkov. All rights reserved.
//

import UIKit

protocol EnterPresenterInput: class {
    
}

protocol EnterPresenterOutput: class {
    var interactor: EnterPresenterInput? { get set }
}

final class EnterPresenter {

    weak var output: EnterPresenterOutput?
    
    var interactor: EnterInteractor?
}

extension EnterPresenter: EnterPresenterInput {
    
}
