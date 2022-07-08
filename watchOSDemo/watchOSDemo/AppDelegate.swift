//
//  AppDelegate.swift
//  watchOSDemo
//
//  Created by Muhammed Kurfeyiz on 16.06.2022.
//

import UIKit
import WatchConnectivity

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var person: Person?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        var session: WCSession?
//
//        if WCSession.isSupported() {
//            session = WCSession.default
//            session?.delegate = self
//            session?.activate()
//        } else {
//            print("Connectivity is not supported on this iPhone.")
//        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

extension AppDelegate: WCSessionDelegate {
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("sessionDidBecomeInactive iOS \(session)")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("sessionDidDeactivate iOS \(session)")
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("session activationDidCompleteWith iOS state : \(activationState)")
    }
}

struct Person: Codable {
    let name: String
    let surname: String
    let age: String
    let occupation: String
    let country: String
}

