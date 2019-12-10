//
//  UIStoryboard+Constants.swift
//  Daily-Expenses
//
//  Created by bishal ghimire on 12/9/19.
//  Copyright © 2019 bishal ghimire. All rights reserved.
//
// https://medium.com/swift-programming/uistoryboard-safer-with-enums-protocol-extensions-and-generics-7aad3883b44d

import UIKit

extension UIStoryboard {

  enum Name: String {
    case dailyNumber = "DailyNumber"
    case home = "Home"
    case onboarding = "Onboarding"
    case profile = "Profile"
    case permission = "Permission"
    case saving = "Saving"
    case splash = "Splash"
    case transaction = "Transaction"

    var filename: String {
      return rawValue
    }

    var navControllerName: String {
      return rawValue
    }

  }

  convenience init(storyboard storyboardName: Name, bundle: Bundle? = nil) {
    self.init(name: storyboardName.filename, bundle: bundle)
  }

}

extension UIStoryboard {

    func initViewController<T: ClassIdentifier>(_ type: T.Type) -> T {
        return instantiateViewController(withIdentifier: type.classIdentifier) as! T
    }

}
