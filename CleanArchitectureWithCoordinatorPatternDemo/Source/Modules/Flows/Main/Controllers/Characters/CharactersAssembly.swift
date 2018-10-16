//
//  CharactersAssembly.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 11.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

protocol CharactersAssemblable: CharactersViewProtocol, CharactersPresenterOutput {}

final class CharactersAssembly {
    static func assembly(with output: CharactersPresenterOutput) {
        let interactor = CharactersInteractor()
        let presenter  = CharactersPresenter()
        
        interactor.presenter = presenter
        presenter.interactor = interactor
        presenter.output     = output
        output.presenter     = presenter
    }
}
