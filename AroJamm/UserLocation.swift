//
//  UserLocation.swift
//  MapKitApplication
//
//  Created by Domenico Lugubre on 10/04/24.
//

import Foundation
import CoreLocation
class UserLocation: NSObject, CLLocationManagerDelegate, ObservableObject{
    var locationManager: CLLocationManager
    @Published var currentLocation : CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    override init() {
        self.locationManager = CLLocationManager()
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            self.currentLocation = location.coordinate
        }
    }

}
