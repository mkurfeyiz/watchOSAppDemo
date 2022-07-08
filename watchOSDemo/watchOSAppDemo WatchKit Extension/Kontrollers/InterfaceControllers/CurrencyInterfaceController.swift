//
//  CurrencyInterfaceController.swift
//  watchOSAppDemo WatchKit Extension
//
//  Created by Muhammed Kurfeyiz on 17.06.2022.
//

import WatchKit
import Foundation


class CurrencyInterfaceController: WKInterfaceController {

    @IBOutlet var currencyTable: WKInterfaceTable!
    
    private var currencyList = [CurrencyUIModel]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        setTitle("Currency List")
        currencyList = [
            CurrencyUIModel(image: "europeanUnion", name: "EUR", buyRate: "18.4829", sellRate: "18.4532"),
            CurrencyUIModel(image: "unitedStates1", name: "USD", buyRate: "17.4829", sellRate: "17.4532"),
            CurrencyUIModel(image: "goldIcon", name: "XAU", buyRate: "995.4829", sellRate: "995.4532"),
            CurrencyUIModel(image: "europeanUnion", name: "EUR", buyRate: "18.4829", sellRate: "18.4532"),
            CurrencyUIModel(image: "unitedStates1", name: "USD", buyRate: "17.4829", sellRate: "17.4532"),
            CurrencyUIModel(image: "goldIcon", name: "XAU", buyRate: "995.4829", sellRate: "995.4532"),
            CurrencyUIModel(image: "europeanUnion", name: "EUR", buyRate: "18.4829", sellRate: "18.4532"),
            CurrencyUIModel(image: "unitedStates1", name: "USD", buyRate: "17.4829", sellRate: "17.4532"),
            CurrencyUIModel(image: "goldIcon", name: "XAU", buyRate: "995.4829", sellRate: "995.4532")
        ]
        
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
    
    private func setTable() {
        currencyTable.setNumberOfRows(currencyList.count, withRowType: "currencyRow")
        for (index, currency) in currencyList.enumerated() {
            let row = currencyTable.rowController(at: index) as! CurrencyRowController
            row.image.setImageNamed(currency.image)
            row.name.setText(currency.name)
            row.sellRate.setText(currency.sellRate)
            // Used NSAttributedString to make the last 2 digits smaller.
            let sellRateRange = (currency.sellRate as NSString).range(of: String(currency.sellRate.suffix(2)))
            let attributedString = NSMutableAttributedString(string: currency.sellRate)
            attributedString.setAttributes([NSMutableAttributedString.Key.font: UIFont.systemFont(ofSize: 11, weight: .semibold)], range: sellRateRange)
            row.sellRate.setAttributedText(attributedString)
            row.buyRate.setText("Buying: " + currency.buyRate)
        }
    }

}
