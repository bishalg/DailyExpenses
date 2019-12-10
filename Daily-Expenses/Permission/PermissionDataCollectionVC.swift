//
//  PermissionDataCollectionVC.swift
//  Daily-Expenses
//
//  Created by bishal ghimire on 12/9/19.
//  Copyright © 2019 bishal ghimire. All rights reserved.
//
/*
 Please set a value for FacebookAutoLogAppEventsEnabled. Set the flag to TRUE if you want to collect app install, app launch and in-app purchase events automatically. To request user consent before collecting data, set the flag value to FALSE, then change to TRUE once user consent is received. Learn more: https://developers.facebook.com/docs/app-events/getting-started-app-events-ios#disable-auto-events.
 **/
/**
 [Firebase/Analytics][I-ACS023008] To enable debug logging set the following application argument: -FIRAnalyticsDebugEnabled (see http://goo.gl/RfcP7r)
 */
import UIKit

class PermissionDataCollectionVC: UIViewController {
    
    // MARK: - Init
    static public func initWithStoryboard() -> PermissionDataCollectionVC {
      let storyboard = UIStoryboard(storyboard: .permission)
      return storyboard.initViewController(PermissionDataCollectionVC.self)
    }
    
    @IBAction func continueAction(_ sender: UIButton) {
        
    }
    
    // MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
