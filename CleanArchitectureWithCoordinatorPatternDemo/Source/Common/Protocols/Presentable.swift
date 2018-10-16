//
//  Presentable.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 16.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

protocol Presentable {
    var toPresent: UIViewController? { get }
}

extension UIViewController: Presentable {
    var toPresent: UIViewController? {
        return self
    }
    
    func showAlert(title: String, message: String? = nil) {
        UIAlertController.showAlert(title            : title,
                                    message          : message,
                                    inViewController : self,
                                    actionBlock      : nil)
    }
}
