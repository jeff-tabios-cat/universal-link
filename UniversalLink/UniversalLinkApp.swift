//
//  UniversalLinkApp.swift
//  UniversalLink
//
//  Created by Jeffrey Tabios on 7/15/22.
//

import SwiftUI
import Firebase
@main
struct UniversalLinkApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        Auth.auth().setAPNSToken(deviceToken, type: AuthAPNSTokenType.sandbox)
    }

    func application(_ application: UIApplication , didReceiveRemoteNotification notification: [AnyHashable : Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
    {
        if Auth.auth().canHandleNotification(notification)
        {
            completionHandler(UIBackgroundFetchResult.noData);
            return
        }
    }
}
