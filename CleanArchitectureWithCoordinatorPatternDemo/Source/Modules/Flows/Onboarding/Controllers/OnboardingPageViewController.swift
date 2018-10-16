//
//  OnboardingPageViewController.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created by Umbrella tech on 10.11.2017.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

final class OnboardingPageViewController: UIPageViewController, OnboardingViewProtocol {
    
    var onInfo       : CompletionBlock?
    var onCompletion : CompletionBlock?
    
    // MARK:- Private variables
    fileprivate var numberOfViewControllers: Int {
        return images.count
    }
    
    fileprivate let images: [UIImage] = [#imageLiteral(resourceName: "art1"),
                                         #imageLiteral(resourceName: "art2"),
                                         #imageLiteral(resourceName: "art3")]
    
    // MARK:- UIViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension OnboardingPageViewController {
    func setup() {
        dataSource = self
        
        if let viewController = showViewController(at: 0) {
            set(viewControllers: [viewController])
        }
    }
    
    func showViewController(at index: Int) -> OnboardingViewController? {
        guard index != NSNotFound, index >= 0, index < numberOfViewControllers else { return nil }
        let viewController = OnboardingViewController.controllerFromStoryboard(.onboarding)
        viewController.index      = index
        viewController.image      = images[index]
        viewController.isLast     = index == 2
        viewController.onGoMarvel = onCompletion
        viewController.onInfo     = onInfo
        
        return viewController
    }
    
    func set(viewControllers: [UIViewController]) {
        setViewControllers(viewControllers,
                           direction  : .forward,
                           animated   : true,
                           completion : nil)
    }
}

// MARK:- UIPageViewControllerDataSource
extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! OnboardingViewController).index
        index -= 1
        return showViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! OnboardingViewController).index
        index += 1
        
        return showViewController(at: index)
    }
}
