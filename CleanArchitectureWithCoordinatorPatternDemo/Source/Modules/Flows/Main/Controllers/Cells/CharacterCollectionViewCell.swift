//
//  CharacterCVCC.swift
//  Marvel
//
//  Created by Максим on 08.09.16.
//  Copyright © 2016 Максим. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterCollectionViewCell: UICollectionViewCell {
    
    var character : Character? {
        didSet {
            guard let character = character else { return }
            updateUI(with: character)
        }
    }
    
    fileprivate var imageView = UIImageView()
    
    // MARK: - Private
    @IBOutlet fileprivate weak var characterImageView: UIImageView!
    
    @IBOutlet fileprivate weak var characterNameLabel: UILabel!
    
    @IBOutlet fileprivate weak var textView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 60.0
        clipsToBounds = true
    }
}

// MARK:- Private methods
private extension CharacterCollectionViewCell {
    func updateUI(with character: Character) {
        characterNameLabel.text = character.name
        characterNameLabel.alpha = 0.0
        guard
            let imageURL = character.image?.path,
            let imageExtension = character.image?.ext,
            let resource = URL(string: imageURL + "/portrait_uncanny." + imageExtension)
            else { return }
        characterImageView.kf.setImage(with: resource,
                                       placeholder: nil,
                                       options: nil,
                                       progressBlock: nil) { [weak self] (image, _, _, _) in
                                        self?.characterNameLabel.alpha = 1.0
        }
    }
}
