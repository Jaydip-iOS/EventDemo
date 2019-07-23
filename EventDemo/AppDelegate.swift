//
//  AppDelegate.swift
//  EventDemo
//
//  Created by Developer on 22/07/19.
//  Copyright © 2019 Jaydip. All rights reserved.
//

import UIKit
import Analytics
import segment_appsflyer_ios
import AppsFlyerLib

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AppsFlyerTrackerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        

        let configuration = SEGAnalyticsConfiguration(writeKey: "BwS9TEvwboutwlahUbmDQt9YbKtMzida")
        configuration.trackApplicationLifecycleEvents = true
        configuration.enableAdvertisingTracking = true
        configuration.recordScreenViews = true
        configuration.flushAt = 1
        configuration.use(SEGAppsFlyerIntegrationFactory())
        SEGAnalytics.setup(with: configuration)
        SEGAnalytics.shared().identify("test")
        SEGAnalytics.shared().track("Welcome Test", properties: ["DatauserName": 123])
        SEGAnalytics.shared().track("Events4Appsfyler", properties: ["DatauserName": 123])
        
//        AppsFlyerTracker.shared().appsFlyerDevKey = "eCA3mxPS37BCEW9YM2MKKC"
//        AppsFlyerTracker.shared().appleAppID = "1467759943"
//        AppsFlyerTracker.shared().delegate = self
//        AppsFlyerTracker.shared().isDebug = true
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        AppsFlyerTracker.shared().trackAppLaunch()
        SEGAnalytics.shared().flush()
        AppsFlyerTracker.shared().trackEvent(AFEventPurchase,
                                             withValues: [
                                                AFEventParamRevenue: "1200",
                                                AFEventParamContent: "shoes",
                                                AFEventParamContentId: "123"
            ]);

    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

