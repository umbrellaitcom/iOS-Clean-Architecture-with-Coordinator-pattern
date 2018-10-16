//
//  CharactersDataSource.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 11.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

protocol CharactersDataSourceDelegate: class {
    var collectionView: UICollectionView! { get }
    var index: Int! { get set }
}

final class CharactersDataSource: NSObject {
    
    lazy var characters: [Character] = []
    
    weak var delegate: CharactersDataSourceDelegate?
}

// MARK:- UICollectionViewDataSource
extension CharactersDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(CharacterCollectionViewCell.self, indexPath: indexPath)
        cell.character = characters[indexPath.item]
        return cell
    }
}

// MARK:- UIScrollViewDelegate
extension CharactersDataSource : UIScrollViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let layout = delegate?.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard let delegate = delegate else { return }
        
        let layout = delegate.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        let offset = scrollView.contentOffset
        
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        
        let roundedIndex = round(index)
        if Int(roundedIndex) > delegate.index || Int(roundedIndex) < delegate.index {
            delegate.index = Int(roundedIndex)
        }
    }
}

// MARK:- UICollectionViewDelegate
extension CharactersDataSource: UICollectionViewDelegate {}
