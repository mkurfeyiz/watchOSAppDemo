//
//  ContactUsInterfaceController.swift
//  watchOSAppDemo WatchKit Extension
//
//  Created by Muhammed Kurfeyiz on 17.06.2022.
//

import WatchKit
import Foundation


class ContactUsInterfaceController: WKInterfaceController {
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func phoneCall() {
        self.presentAlert(withTitle: "Contact Us",
                          message: "Are you sure you want to make a phone call?",
                          preferredStyle: .actionSheet,
                          actions: [
                            WKAlertAction(title: "Yes", style: .default, handler: {
                                let phone = "08501113848"
                                WKExtension.shared().openSystemURL(URL(string: "tel:\(phone)")!)
                                
                            }),
                            WKAlertAction(title: "Cancel", style: .cancel, handler: {
                                
                            })
                          ]
        )
    }
    
    @IBAction func cancelPhoneCall() {
        pop()
    }
}
