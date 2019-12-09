//
//  AppDelegate.swift
//  Daily-Expenses
//
//  Created by bishal ghimire on 12/9/19.
//  Copyright © 2019 bishal ghimire. All rights reserved.
//

import UIKit
import Firebase
import Crashlytics
import FBSDKLoginKit
import FBSDKCoreKit
import GoogleSignIn
import FirebaseFirestore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    // MARK: App Lifecycle
    // Override point for customization after application launch.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        firebaseConfig()
        
        // UIApplication.shared.statusBarStyle = .lightContent
        // UINavigationBar.appearance().backIndicatorImage = AppImages.backArrowImage
        // UINavigationBar.appearance().backIndicatorTransitionMaskImage = AppImages.backArrowImage
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        
        loadSplashVC()
        
        return ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func loadSplashVC() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let splashVC = SplashVC.initWithStoryboard()
        self.window?.rootViewController = splashVC
        self.window?.makeKeyAndVisible()
    }
    
    func firebaseConfig() {
        FirebaseApp.configure()
        Fabric.with([Crashlytics.self])
        _ = Firestore.firestore()
    }
    
    func transparentNavBar() {
        // Override point for customization after application launch.
        // Sets background to a blank/empty image
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        // Sets shadow (line below the bar) to a blank image
        UINavigationBar.appearance().shadowImage = UIImage()
        // Sets the translucent background color
        UINavigationBar.appearance().backgroundColor = .clear
        // Set translucent. (Default value is already true, so this can be removed if desired.)
        UINavigationBar.appearance().isTranslucent = true
    }
    
    func application(_ application: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String
        let annotation = options[UIApplication.OpenURLOptionsKey.annotation]
        _ =  ApplicationDelegate.shared.application(application,
                                                    open: url,
                                                    sourceApplication: sourceApplication,
                                                    annotation: annotation)
        return GIDSignIn.sharedInstance().handle(url)
    }
    
}

extension AppDelegate {
    
    class func delegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
}
