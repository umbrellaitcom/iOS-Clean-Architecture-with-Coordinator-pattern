//
//  CharactersPresenter.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 11.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

protocol CharactersPresenterInput: class {
    func getCharacters(by offset: Int, count: Int)
}

protocol CharactersPresenterOutput: class {
    var presenter: CharactersPresenterInput? { get set }
    
    func showActivity()
    func hideActivity()
    
    func received(characters: [Character])
}

final class CharactersPresenter {

    weak var output: CharactersPresenterOutput?
    
    var interactor: CharactersInteractor?
    
    func received(characters: [Character]) {
        output?.hideActivity()
        output?.received(characters: characters)
    }
}

// MARK:- CharactersPresenterInput
extension CharactersPresenter: CharactersPresenterInput {
    func getCharacters(by offset: Int, count: Int) {
        output?.showActivity()
        interactor?.getCharacters(by: offset, count: count)
    }
}
