//
//  WKInterfaceImageExtension.swift
//  watchOSAppDemo WatchKit Extension
//
//  Created by Muhammed Kurfeyiz on 17.06.2022.
//

import Foundation
import WatchKit

extension WKInterfaceImage {
    func setSize(for image: WKInterfaceImage, width: CGFloat, height: CGFloat) {
        image.setWidth(width)
        image.setHeight(height)
    }
}
