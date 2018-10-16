//
//  UIAlertController+Helper.swift
//  Worker Dashy
//
//  Created by Umbrella tech on 22.08.17.
//  Copyright © 2017 Umbrella. All rights reserved.
//

import UIKit

public extension UIAlertController {
    public static func showAlert(
        title: String?,
        message: String?,
        tintColor: UIColor? = nil,
        inViewController viewController: UIViewController,
        actionBlock: (() -> Void)? = nil)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertActionOk = UIAlertAction(title: "OK", style: .default) { action in
            alert.dismiss(animated: true, completion: nil)
            if let actionBlock = actionBlock {
                actionBlock()
            }
        }
        
        alert.addAction(alertActionOk)
        DispatchQueue.main.async(execute: {
            viewController.present(alert, animated: true, completion: nil)
            if tintColor != nil {
                alert.view.tintColor = tintColor!
            }
        })
    }
    
    public static func showActionSheet(
        title: String?,
        message: String?,
        viewController: UIViewController,
        actions: [UIAlertAction]?,
        cancelTitle: String,
        tintColor: UIColor?)
    {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UI_USER_INTERFACE_IDIOM() == .pad ? .alert : .actionSheet)
        alert.addActions(actions)
        let alertActionCancel = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        alert.addAction(alertActionCancel)
        DispatchQueue.main.async(execute: {
            viewController.present(alert, animated: true, completion: nil)
            if tintColor != nil {
                alert.view.tintColor = tintColor!
            }
        })
    }
    
    func addAction(title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?) {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        addAction(action)
    }
    
    func addCancelAction(title: String?) {
        let action = UIAlertAction(title: title, style: .cancel, handler: nil)
        addAction(action)
    }
}

// MARK:- Add methods
public extension UIAlertController {
    public func addActions(_ actions: [UIAlertAction]?) {
        actions?.forEach { self.addAction($0) }
    }
}
