//
//  OnboardingViewController.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 06.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK:- Public variables
    var index = 0
    
    var image: UIImage!
    
    var isLast: Bool = false
    
    var onGoMarvel : CompletionBlock?
    var onInfo     : CompletionBlock?
    
    // MARK:- IBOutlets
    @IBOutlet fileprivate weak var imageView: UIImageView!
    
    @IBOutlet fileprivate weak var pageControl: UIPageControl!
    
    @IBOutlet fileprivate weak var goMarvelButton: UIButton!
    
    // MARK:- UIViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    @IBAction func goMarvelPressed(_ sender: UIButton) {
        onGoMarvel?()
    }
    
    @IBAction func infoPressed(_ sender: UIButton) {
        onInfo?()
    }
}

//MARK:- Private methods
extension OnboardingViewController {
    func setup() {
        setupUI()
    }
    
    func setupUI() {
        DispatchQueue.main.async { [unowned self] in
            self.imageView.image = self.image
        }
        pageControl.currentPage = index
        goMarvelButton.isHidden = !isLast
    }
}
