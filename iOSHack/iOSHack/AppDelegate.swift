//
//  AppDelegate.swift
//  iOSHack
//
//  Created by Vinay Ganesh on 3/31/17.
//  Copyright © 2017 Vinay Ganesh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("Application will resign active")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Application did enter background")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("Application will enter foreground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("Application Did Become Active")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("Application Will Termicate")
    }
}

