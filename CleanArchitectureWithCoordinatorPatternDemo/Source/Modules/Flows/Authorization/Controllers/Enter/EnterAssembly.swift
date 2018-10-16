//
//  EnterAssembly.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created Maksim Kazachkov on 10.11.2017.
//  Copyright © 2017 Maksim Kazachkov. All rights reserved.
//

import UIKit

protocol EnterAssemblable: EnterViewProtocol, EnterPresenterOutput {}

final class EnterAssembly {
    static func assembly(with output: EnterPresenterOutput) {
        let interactor = EnterPresenter()
        let presenter  = EnterInteractor()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.output     = output
        output.presenter     = presenter
    }
}
