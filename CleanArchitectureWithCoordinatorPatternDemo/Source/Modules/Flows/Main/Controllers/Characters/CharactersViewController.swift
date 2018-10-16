//
//  CharactersViewController.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 11.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

final class CharactersViewController: UIViewController, CharactersAssemblable, CharactersDataSourceDelegate {
    
    var presenter: CharactersPresenterInput?
    
    @IBOutlet fileprivate weak var backgroundImageView : UIImageView!
    
    @IBOutlet fileprivate weak var loadCharactersIndicatorView : UIActivityIndicatorView!
    @IBOutlet fileprivate weak var activityIndicatorView       : UIActivityIndicatorView!
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    fileprivate var dataSource = CharactersDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        activityIndicatorView.startAnimating()
        presenter?.getCharacters(by: offset, count: count)
    }
    
    fileprivate let count: Int = 3
    
    fileprivate var offset : Int = 0 {
        didSet {
            presenter?.getCharacters(by: self.offset, count: self.count)
        }
    }
    
    var index : Int! = 0 {
        didSet {
            if index >=  dataSource.characters.count - 3 {
                offset += 3
            }
        }
    }
}

// MARK:- Private methods
private extension CharactersViewController {
    func setup() {
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = dataSource
        collectionView.delegate   = dataSource
        
        dataSource.delegate       = self
    }
}

// MARK:- CharactersPresenterOutput
extension CharactersViewController {
    func showActivity() {
        dataSource.characters.isEmpty ?  activityIndicatorView.startAnimating() : loadCharactersIndicatorView.startAnimating()
    }
    
    func hideActivity() {
        dataSource.characters.isEmpty ?  activityIndicatorView.stopAnimating() : loadCharactersIndicatorView.stopAnimating()
    }
    
    func received(characters: [Character]) {
        dataSource.characters.append(contentsOf: characters)
        let newIndexPaths = IndexPath.configure(for: characters,
                                                with: dataSource.characters,
                                                section: 0)
        collectionView.insertItems(at: newIndexPaths)
    }
}
