//
//  AppDelegate.swift
//  Pokedox
//
//  Created by Saroj Tiwari on 26/11/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let rootViewController: UIViewController? = PokemonListWireframe().getMainView()
        self.window?.rootViewController = UINavigationController(rootViewController: rootViewController!)
//        self.window?.backgroundColor =
        return true
    }


}

