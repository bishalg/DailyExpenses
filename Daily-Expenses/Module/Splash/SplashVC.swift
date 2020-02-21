//
//  SplashVC.swift
//  Daily-Expenses
//
//  Created by bishal ghimire on 12/9/19.
//  Copyright © 2019 bishal ghimire. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {
    
    // MARK: - Init
    static public func initWithStoryboard() -> SplashVC {
      let storyboard = UIStoryboard(storyboard: .splash)
      return storyboard.initViewController(SplashVC.self)
    }
    
    // MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delay(3.0) {
            let permissionDataCollectionVC = PermissionDataCollectionVC.initWithStoryboard()
            permissionDataCollectionVC.makeRootVC()
        }
    }
    
}
