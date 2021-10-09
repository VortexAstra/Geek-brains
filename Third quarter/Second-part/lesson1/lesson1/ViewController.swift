//
//  ViewController.swift
//  lesson1
//
//  Created by artem.ustinov on 08.10.2021.
//

import UIKit
import GoogleMaps
import CoreLocation

final class ViewController: UIViewController {

//  MARK: - IB
    @IBOutlet private weak var mapView: GMSMapView!

    @IBAction private func isTrackingButton(_ button: UIBarButtonItem) {
        locationManager.startUpdatingLocation()
    }

//  MARK: - PROPERTY
    private let locationManager = CLLocationManager()
    private lazy var coordinate = CLLocationCoordinate2D(latitude: 55.753215, longitude: 37.622504)
    private lazy var camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 17)

    private var isTracking = false

//  MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupLocationManager()
    }
}

private extension ViewController {

    func setupMapView() {
        mapView.camera = camera
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        mapView.isTrafficEnabled = true
        mapView.delegate = self
        applyCustomStyle()
    }

    func setupLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
    }

    func addMarker(to coordination: CLLocationCoordinate2D) {
        let marker = GMSMarker(position: coordination)
        marker.icon = GMSMarker.markerImage(with: nil)
        marker.title = "Custom title"
        marker.map = mapView
    }

    func applyCustomStyle() {
        guard
            let url = Bundle.main.url(forResource: "map-style", withExtension: "json")
        else { return }

        mapView.mapStyle = try? GMSMapStyle(contentsOfFileURL: url)
    }
}


//  MARK: - GMSMapViewDelegate
extension ViewController: GMSMapViewDelegate {

    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        return true
    }
}

//  MARK: - CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else { return }
        mapView.animate(to: GMSCameraPosition.camera(withTarget: lastLocation.coordinate, zoom: 17))
        addMarker(to: lastLocation.coordinate)
    }
}
