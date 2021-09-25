//
//  AppDelegate.swift
//  MarvelHeroesApp
//
//  Created by angel.bayon on 25/9/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        if window != nil {
            BaseRouter.setRoot(navigationController: HomeAssembly.homeNavigationView())
        }

        return true
    }

}
