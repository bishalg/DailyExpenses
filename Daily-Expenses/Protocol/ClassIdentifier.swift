//
//  ClassIdentifier.swift
//  Daily-Expenses
//
//  Created by bishal ghimire on 12/9/19.
//  Copyright © 2019 bishal ghimire. All rights reserved.
//

import UIKit

protocol ClassIdentifier: class {
    static var classIdentifier: String { get }
}

extension ClassIdentifier {

    static var classIdentifier: String {
        return String(describing: self)
    }

}

extension UIViewController: ClassIdentifier { }
