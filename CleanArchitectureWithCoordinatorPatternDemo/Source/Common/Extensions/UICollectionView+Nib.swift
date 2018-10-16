//
//  UICollectionView+Nib.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 17.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerNib<T: UICollectionViewCell>(_ cellType: T.Type) {
        let className = String(describing: cellType)
        let nib = UINib(nibName: className, bundle: nil)
        let identifier = className + "ID"
        register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    func registerNibForSupplementaryViewOfKind<T: UICollectionViewCell>(_ cellType: T.Type, kind: String) {
        let className = String(describing: cellType)
        let nib = UINib(nibName: className, bundle: nil)
        let identifier = className + "ID"
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(_ cellType: T.Type, indexPath: IndexPath) -> T {
        let className = String(describing: cellType)
        let identifier = className + "ID"
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
    }
}
