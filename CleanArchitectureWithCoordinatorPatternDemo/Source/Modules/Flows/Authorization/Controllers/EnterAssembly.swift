//
//  EnterAssembly.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 11.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

protocol EnterAssemblable: EnterViewProtocol, EnterPresenterOutput {}

final class EnterAssembly {
    static func assembly(with output: EnterPresenterOutput) {
        let interactor = EnterInteractor()
        let presenter  = EnterPresenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.output     = output
        output.presenter     = presenter
    }
}
