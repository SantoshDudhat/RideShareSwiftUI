//
//  GoogleMapView.swift
//  RideShare
//
//  Created by DREAMWORLD on 20/12/24.
//

import Foundation
import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
    
    @Binding var userLocation: CLLocationCoordinate2D?
    
    private let mapView = GMSMapView()
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(
            withLatitude: userLocation?.latitude ?? 37.7749,
            longitude: userLocation?.longitude ?? -122.4194,
            zoom: 15
        )
        let mapView = GMSMapView(frame: .zero, camera: camera)
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        guard let location = userLocation else { return }
        
        // Clear all existing markers
        uiView.clear()
        
        // Add a new marker
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        
        marker.icon = UIImage(named: "img_current_place_indicator")
        
        marker.map = uiView
        
        // Update camera position
        let camera = GMSCameraPosition.camera(
            withLatitude: location.latitude,
            longitude: location.longitude,
            zoom: 15
        )
        uiView.animate(to: camera)
    }
}


struct GoogleMapWithPolylineView: UIViewRepresentable {
    @Binding var startCoordinate: CLLocationCoordinate2D
    @Binding var endCoordinate: CLLocationCoordinate2D
    var pathCoordinates: [CLLocationCoordinate2D]

    func makeUIView(context: Context) -> GMSMapView {
        let mapView = GMSMapView(frame: .zero)
        mapView.delegate = context.coordinator

        // Set the camera to show the entire path
        if let first = pathCoordinates.first, let last = pathCoordinates.last {
            let bounds = GMSCoordinateBounds(coordinate: first, coordinate: last)
            let update = GMSCameraUpdate.fit(bounds, withPadding: 60)
            mapView.moveCamera(update)
        }
        return mapView
    }

    func updateUIView(_ mapView: GMSMapView, context: Context) {
        mapView.clear()

        // Create the polyline path
        let path = GMSMutablePath()
        pathCoordinates.forEach { path.add($0) }

        let polyline = GMSPolyline(path: path)
        polyline.strokeColor = UIColor(themeGreenColor)
        polyline.strokeWidth = 6
        polyline.map = mapView

        // Add custom markers at start and end points
        addCustomMarker(at: startCoordinate, title: "Start", mapView: mapView, image: "img_pickup_pin")
        addCustomMarker(at: endCoordinate, title: "End", mapView: mapView, image: "img_current_pin")
    }

    private func addCustomMarker(at coordinate: CLLocationCoordinate2D, title: String, mapView: GMSMapView, image: String) {
        let marker = GMSMarker(position: coordinate)
//        marker.title = title
        marker.icon = UIImage(named: image) // Replace with your custom marker image
        marker.map = mapView
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, GMSMapViewDelegate {}
}
