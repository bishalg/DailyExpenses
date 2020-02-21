//
//  UIViewController+Extension.swift
//  Antibudget
//
//  Created by Bishal Ghimire on 6/30/19.
//  Copyright © 2019 Bishal Ghimire. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Currently being used in DailyNumberVC
    func isModel() -> Bool {
        if presentingViewController != nil {
            return true
        } else if presentingViewController?.presentedViewController == navigationController {
            return true
        } else if tabBarController?.presentingViewController?.isKind(of: UITabBarController.self) ?? false {
            return true
        } else if isBeingPresented {
            return true
        }
        return false
    }
    
    var isModal: Bool {
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
    
}

///
/// https://www.swiftbysundell.com/basics/child-view-controllers
///
extension UIViewController {
    
    func addVC(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func removeVC() {
        // Just to be safe, we check that this view controller
        // is actually added to a parent before removing it.
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
}

///
/// https://stackoverflow.com/a/48065833/1294448
///
extension UIViewController {
    
    func showInputDialog(title: String? = nil,
                         subtitle: String? = nil,
                         actionTitle: String? = "Add",
                         cancelTitle: String? = "Cancel",
                         inputPlaceholder: String? = nil,
                         inputKeyboardType: UIKeyboardType = UIKeyboardType.default,
                         cancelHandler: ((UIAlertAction) -> Void)? = nil,
                         actionHandler: ((_ text: String?) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addTextField { (textField: UITextField) in
            textField.placeholder = inputPlaceholder
            textField.keyboardType = inputKeyboardType
        }
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (_: UIAlertAction) in
            guard let textField = alert.textFields?.first else {
                actionHandler?(nil)
                return
            }
            actionHandler?(textField.text)
        }))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))
        present(alert, animated: true, completion: nil)
    }
    
    func destructiveConfirmAlert(title: String? = nil,
                                 subtitle: String? = nil,
                                 actionTitle: String? = "Delete",
                                 cancelTitle: String? = "Cancel",
                                 cancelHandler: ((UIAlertAction) -> Void)? = nil,
                                 actionHandler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .destructive, handler: { (_: UIAlertAction) in
            actionHandler?()
        }))
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelHandler))
        present(alert, animated: true, completion: nil)
    }
    
}

extension UIViewController {
    
    func forceKeyboardDismiss() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        view.endEditing(true)
    }
    
}

extension UIViewController {
    
    func makeRootVC() {
        if let window = UIApplication.shared.delegate?.window {
            window?.rootViewController = self
            self.view.endEditing(true)
            window?.makeKeyAndVisible()
        }
    }
    
}

extension UIViewController {
    
    func topViewController(in rootViewController: UIViewController?) -> UIViewController? {
        guard let rootViewController = rootViewController else {
            return nil
        }
        
        if let tabBarController = rootViewController as? UITabBarController {
            return topViewController(in: tabBarController.selectedViewController)
        } else if let navigationController = rootViewController as? UINavigationController {
            return topViewController(in: navigationController.visibleViewController)
        } else if let presentedViewController = rootViewController.presentedViewController {
            return topViewController(in: presentedViewController)
        }
        return rootViewController
    }
    
}
