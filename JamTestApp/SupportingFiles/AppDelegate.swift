//
//  AppDelegate.swift
//  JamTestApp
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
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 1.0
        flowLayout.minimumLineSpacing = 1.0
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 1, height: UIScreen.main.bounds.height / 3)
        let repositoriesCVC = RepositoriesCollectionViewController(collectionViewLayout: flowLayout)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: repositoriesCVC)
        window?.makeKeyAndVisible()
        return true
    }
}

