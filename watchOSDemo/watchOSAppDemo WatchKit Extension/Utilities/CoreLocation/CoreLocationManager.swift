//
//  CoreLocationManager.swift
//  watchOSAppDemo WatchKit Extension
//
//  Created by Muhammed Kurfeyiz on 16.06.2022.
//

import Foundation
import CoreLocation

class CoreLocationManager: NSObject {
    static let shared = CoreLocationManager()
    var locationManager: CLLocationManager!
    var currentLocation: CLLocation?
    var isLocationServicesAuthorized: Bool?
    
    private override init() {
        super.init()
    }
    
    func setupLocationManager(onComplete: @escaping () -> Void) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 1
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
            switch locationManager.authorizationStatus {
            case .authorizedAlways, .authorizedWhenInUse:
                isLocationServicesAuthorized = true
                guard let location = locationManager.location else { return }
                currentLocation = location
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
                didLocationServicesAuthorized()
            case .denied, .restricted:
                isLocationServicesAuthorized = false
                currentLocation = nil
            @unknown default:
                break
            }
        }
        onComplete()
    }
    
    // MARK: - Private Functions
    private func didLocationServicesAuthorized() {
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            isLocationServicesAuthorized = true
        case .notDetermined, .denied, .restricted:
            isLocationServicesAuthorized = false
        @unknown default:
            break
        }
    }
    
    private func checkLocationAuthorizationStatus(authorizationStatus: CLAuthorizationStatus) {
        switch authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            isLocationServicesAuthorized = true
            locationManager.requestLocation()
            guard let location = locationManager.location else { return }
            currentLocation = location
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            didLocationServicesAuthorized()
        case .denied, .restricted:
            isLocationServicesAuthorized = false
            currentLocation = nil
        @unknown default:
            break
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension CoreLocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        currentLocation = location
    }
}
