//
//  AppDelegate.swift
//  GenCon-iOS
//
//  Created by Taillook on 2017/10/05.
//  Copyright © 2017年 Taillook. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    let ud = UserDefaults()
    let notifi = Notifi()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let statusBarWindow = UIApplication.shared.value(forKey: "statusBarWindow") as? UIView {
            let statusBar = statusBarWindow.subviews[0]
            statusBar.backgroundColor = UIColor.mainDark
        }
        
        if #available(iOS 10.0, *) {
            
            //ios10
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                if error != nil {
                    return
                }
                if granted {
                    debugPrint("通知許可")
                    center.delegate = self
                    application.registerForRemoteNotifications()
                } else {
                    debugPrint("通知拒否")
                }
            })
            
        } else {
            // ios9
            let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
            UIApplication.shared.registerForRemoteNotifications()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        var events = [EventObject]()
        if self.ud.object(forKey: "events") != nil {
            events = NSKeyedUnarchiver.unarchiveObject(with: self.ud.object(forKey: "events") as! Data) as! [EventObject]
            for i in events {
                if i.isNotifi == false {
                    notifi.set(mode: "イベント", text: i.eventTitle!, date: i.startDateTime!)
                    i.isNotifi = true
                }
            }
            let eventsdata = NSKeyedArchiver.archivedData(withRootObject: events)
            self.ud.set(eventsdata, forKey: "events")
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

