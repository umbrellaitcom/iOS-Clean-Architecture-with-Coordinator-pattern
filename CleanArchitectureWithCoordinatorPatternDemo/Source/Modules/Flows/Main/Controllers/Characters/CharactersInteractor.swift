//
//  CharactersInteractor.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 11.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

final class CharactersInteractor {

    weak var presenter: CharactersPresenter?
    
    fileprivate let mainReqeustManager = MainRequestManager()
    
    func getCharacters(by offset: Int, count: Int) {
        mainReqeustManager.getCharacters(offset: offset,
                                         count: count,
                                         failure: { (_) in
                                            // TODO:- show alert?
        }) { [weak self] (result: [Character]) in
            guard let `self` = self else { return }
            self.presenter?.received(characters: result)
        }
    }
}
