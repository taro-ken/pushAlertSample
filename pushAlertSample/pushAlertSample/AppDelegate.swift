//
//  AppDelegate.swift
//  pushAlertSample
//
//  Created by 木元健太郎 on 2022/02/04.
//

import UIKit

 
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 通知許可の取得
        UNUserNotificationCenter.current().requestAuthorization(
        options: [.alert, .sound, .badge]){
            (granted, _) in
            if granted{
                UNUserNotificationCenter.current().delegate = self
            }
        }
        
        return true
    }
 
    // MARK: UISceneSession Lifecycle
 
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//
//    }
}
 
// 通知を受け取ったときの処理
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
 
        print("Notified")
        // アプリ起動時も通知を行う
        completionHandler([.sound, .alert ])
    }
}
