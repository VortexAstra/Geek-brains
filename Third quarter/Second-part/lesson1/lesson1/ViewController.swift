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
        if isTracking {
            locationManager.stopUpdatingLocation()
            isTracking = false
        } else {
            locationManager.startUpdatingLocation()
            isTracking = true
            startNewTrack()
        }
    }

//  MARK: - PROPERTY
    private let locationManager = CLLocationManager()
    private lazy var coordinate = CLLocationCoordinate2D(latitude: 55.753215, longitude: 37.622504)
    private lazy var camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 17)
    private var route: GMSPolyline?
    private var path: GMSMutablePath?

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
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.delegate = self
    }

    func applyCustomStyle() {
        guard
            let url = Bundle.main.url(forResource: "map-style", withExtension: "json")
        else { return }

        mapView.mapStyle = try? GMSMapStyle(contentsOfFileURL: url)
    }
}

private extension ViewController {
    func startNewTrack() {
        route?.map = mapView
        route = GMSPolyline()
        route?.strokeColor = .red
        route?.strokeWidth = 4
        path = GMSMutablePath()
        route?.map = mapView
    }

    func addPointToTrack(coordinate: CLLocationCoordinate2D) {
        path?.add(coordinate)
        route?.path = path
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
        print("locations.last", locations.last as Any)
        mapView.animate(to: GMSCameraPosition.camera(withTarget: lastLocation.coordinate, zoom: 17))
        addPointToTrack(coordinate: lastLocation.coordinate)
    }
}
