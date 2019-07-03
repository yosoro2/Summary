//
//  AppDelegate.swift
//  my collection
//
//  Created by yosoro on 2019/1/8.
//  Copyright © 2019 yosoro. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

   

    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        touch()
        Bmob.register(withAppKey: "881a726d47210595b04b2f8dbe95b6ef")
        // Override point for customization after application launch.
        return true
    }
    
    func touch() {
        let homeIcon = UIApplicationShortcutIcon(templateImageName: "books")//3DTouch
        let homeItem = UIApplicationShortcutItem(type: "books", localizedTitle: "书集", localizedSubtitle: "", icon: homeIcon, userInfo: nil)
        let playIcon = UIApplicationShortcutIcon(templateImageName: "movies")
        let playItem = UIApplicationShortcutItem(type: "movies", localizedTitle: "影集", localizedSubtitle: "", icon: playIcon, userInfo: nil)
        let userIcon = UIApplicationShortcutIcon(templateImageName: "shops")
        let userItem = UIApplicationShortcutItem(type: "shops", localizedTitle: "用户名", localizedSubtitle: "", icon: userIcon, userInfo: nil)
        let lessonIcon = UIApplicationShortcutIcon(templateImageName: "lessons")
        let lessonItem = UIApplicationShortcutItem(type: "lessons", localizedTitle: "课程", localizedSubtitle: "", icon: lessonIcon, userInfo: nil)
        let aboutIcon = UIApplicationShortcutIcon(templateImageName: "about")
        let aboutItem = UIApplicationShortcutItem(type: "about", localizedTitle: "关于", localizedSubtitle: "", icon: aboutIcon, userInfo: nil)
        UIApplication.shared.shortcutItems = [homeItem, playItem, userItem,lessonItem,aboutItem]
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
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

