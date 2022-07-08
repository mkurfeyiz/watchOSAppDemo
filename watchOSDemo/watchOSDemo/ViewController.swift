//
//  ViewController.swift
//  watchOSDemo
//
//  Created by Muhammed Kurfeyiz on 16.06.2022.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {
    
    var session: WCSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if WCSession.isSupported() {
            session = WCSession.default
            session?.delegate = self
            session?.activate()
        }
    }

    @IBAction func sendMessage(_ sender: UIButton) {
        if session?.activationState != .activated {
            session?.activate()
        }
        
        // Checks if iPhone is paired with a watch and watch application is installed.
        if session?.isPaired ?? false && session?.isWatchAppInstalled ?? false {
            if session?.isReachable ?? false {
                let person = Person(name: "Deneme",
                                surname: "123",
                                age: "30",
                                occupation: "iOS Dev.",
                                country: "Turkey")
                let data = try? JSONEncoder().encode(person)
                // Doesnt work with replyHandler
                session?.sendMessageData(data ?? Data(), replyHandler: nil)
                do {
                    try session?.updateApplicationContext(["context": person.name])
                } catch {
                    print("An error occured while updating application context.")
                }
                session?.sendMessage(["person": person.occupation], replyHandler: nil)

            } else {
                print("Session is unreachable.")
            }

        } else {
            print("This iPhone is not paired with any watch or watch app is not installed.")
        }
    }
    
}

extension ViewController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("session active \(self)")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("session did become inactive \(self)")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("session did deactive \(self)")
    }
    
    
}

