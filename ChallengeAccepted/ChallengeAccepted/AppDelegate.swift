//
//  AppDelegate.swift
//  ChallengeAccepted
//
//  Created by Medea Ohm on 3/23/17.
//  Copyright © 2017 Medea Ohm. All rights reserved.
//

import UIKit
import Parse


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let configuration = ParseClientConfiguration {
            $0.applicationId = "Fk3yJWWNkJtLIrOvl311kmvvfP5fdSyyFuv90PyQ"
            $0.clientKey = "gsA0o0qx2GO4q59xpzD9tDcWxhlgpSDChhAtKxQb"
            $0.server = "http://localhost:1337/parse"
        }
        Parse.initialize(with: configuration)
        
        return true

    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }
}

