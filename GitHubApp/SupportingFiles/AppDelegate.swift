//
//  AppDelegate.swift
//  GitHubApp
//
//  Created by Josip Rezic on 12/05/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //
    // MARK: - Variables
    //
    
    var window: UIWindow?

    //
    // MARK: - Methods
    //
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let repositoriesCVC = RepositoriesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        UINavigationBar.appearance().barTintColor = .black
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: repositoriesCVC)
        window?.makeKeyAndVisible()
        return true
    }
}

