//
//  PlaceDetailsViewController.swift
//  Awesome Places
//
//  Created by Ludovic Ollagnier on 17/11/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class PlaceDetailsViewController: UIViewController {

    var placeToDisplay: Place?

    let manager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var placeName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
        configureGeolocation()

        var result = 0
        placeName.text = "\(result)"

        DispatchQueue.global(qos: .background).async {
            for i in 0...1000000000 {
                result = i*2
            }

            DispatchQueue.main.async {
                self.placeName.text = "\(result)"
            }
        }

    }

    private func configureGeolocation() {

        guard CLLocationManager.locationServicesEnabled() else { return }

        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            print("Pas d'accès à la position")
        default:
            break
        }

        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        manager.distanceFilter = 100
        manager.delegate = self
//        manager.startUpdatingLocation()
    }

    private func configureController() {
        placeName.text = placeToDisplay?.name
        title = placeToDisplay?.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PlaceDetailsViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)

        guard let lastLocation = locations.last else { return }

        let annotation = MKPointAnnotation()
        annotation.coordinate = lastLocation.coordinate
        mapView.addAnnotation(annotation)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error : ", error)
    }
}
