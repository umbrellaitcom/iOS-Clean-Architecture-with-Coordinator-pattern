//
//  EnterViewController.swift
//  CleanArchitectureWithCoordinatorPatternDemo
//
//  Created Maksim Kazachkov on 10.11.2017.
//  Copyright © 2017 Maksim Kazachkov. All rights reserved.
//

import UIKit

class EnterViewController: UIViewController, EnterAssemblable {

	var presenter: EnterPresenter?

	override func viewDidLoad() {
        super.viewDidLoad()
    }

}
