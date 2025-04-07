//
//  LocationManager.swift
//  RideShare
//
//  Created by DREAMWORLD on 16/12/24.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var latestLocation: CLLocationCoordinate2D?
    
    private var manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        checkLocationAuthorization { _ in }
    }
    
    func checkLocationAuthorization(completion: (CLAuthorizationStatus) -> Void) {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            
        case .restricted:
            print("Location restricted")
            completion(.restricted)
            
        case .denied:
            print("Location denied")
            completion(.denied)
            
        case .authorizedAlways, .authorizedWhenInUse:
            print("Location access granted")
            manager.startUpdatingLocation() // Start updates after permission is granted
            completion(.authorizedWhenInUse)
            
        @unknown default:
            print("Unknown location authorization status")
            completion(.notDetermined)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization { _ in }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.latestLocation = location.coordinate
        }
    }
}
