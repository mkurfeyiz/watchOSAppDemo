//
//  ATMInterfaceController.swift
//  watchOSAppDemo WatchKit Extension
//
//  Created by Muhammed Kurfeyiz on 17.06.2022.
//

import WatchKit
import Foundation

class ATMBranchInterfaceController: WKInterfaceController {

    @IBOutlet var atmBranchTable: WKInterfaceTable!
    
    private var atmBranchList = [ATMBranchUIModel]()
    private var location: CLLocation?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        setTitle("ATM/Branch")
        atmBranchList = [
            ATMBranchUIModel(name: "Şirinevler ATM", distance: "444m", type: .atm),
            ATMBranchUIModel(name: "ŞİRİNEVLER Branch", distance: "444m", type: .branch),
            ATMBranchUIModel(name: "BAKIRKÖY Branch", distance: "3257m", type: .branch),
            ATMBranchUIModel(name: "Sefaköy", distance: "4383m", type: .atm),
            ATMBranchUIModel(name: "Güneşli Branch", distance: "4491m", type: .branch),
            ATMBranchUIModel(name: "Şirinevler ATM", distance: "444m", type: .atm),
            ATMBranchUIModel(name: "ŞİRİNEVLER Branch", distance: "444m", type: .branch),
            ATMBranchUIModel(name: "BAKIRKÖY Branch", distance: "3257m", type: .branch),
            ATMBranchUIModel(name: "Sefaköy", distance: "4383m", type: .atm),
            ATMBranchUIModel(name: "Güneşli Branch", distance: "4491m", type: .branch)
        ]
        
        setupCoreLocation()
        setTable()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: - Private Functions
    private func setTable() {
        atmBranchTable.setNumberOfRows(atmBranchList.count, withRowType: "atmBranchRow")
        for (index, atmBranch) in atmBranchList.enumerated() {
            let row = atmBranchTable.rowController(at: index) as! ATMBranchRowController
            switch atmBranch.type {
            case .branch:
                row.icon.setImage(UIImage(systemName: "building.columns.circle.fill"))
            case .atm:
                row.icon.setImage(UIImage(systemName: "building.columns"))
            default:
                break
            }
            row.atmBranchName.setText(atmBranch.name)
            row.distance.setText(atmBranch.distance)
        }
    }
    
    private func setupCoreLocation() {
        CoreLocationManager.shared.setupLocationManager {
            if CoreLocationManager.shared.isLocationServicesAuthorized ?? false {
                self.location = CoreLocationManager.shared.currentLocation
                DispatchQueue.main.async {
                    self.presentAlert(withTitle: nil,
                                      message: "Location services are active. Your locations coordinates are \(self.location?.coordinate.latitude), \(self.location?.coordinate.longitude)",
                                      preferredStyle: .alert,
                                      actions: [
                                        WKAlertAction(title: "OK", style: .default, handler: {
                                            
                                        })
                                      ])
                }
            } else {
                DispatchQueue.main.async {
                    self.presentAlert(withTitle: nil,
                                      message: "Location services are not authorized at the moment. Please try again after authorizing location services.",
                                      preferredStyle: .alert,
                                      actions: [
                                        WKAlertAction(title: "OK", style: .default, handler: {
                                            self.pop()
                                        })
                                      ])
                }
            }
        }
    }
}
