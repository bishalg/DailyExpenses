//
//  Util.swift
//  Daily-Expenses
//
//  Created by bishal ghimire on 12/10/19.
//  Copyright © 2019 bishal ghimire. All rights reserved.
//

import UIKit

public func delay(_ delay: Double, closure: @escaping () -> Void) {
  DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
    closure()
  }
}

public func mainQueue(_ block: @escaping () -> Void) {
  DispatchQueue.main.async(execute: block)
}
