//
//  ModelData.swift
//  BenchFinder
//
//  Created by Dominik Helbling on 21.06.22.
//
import SwiftUI
import MapKit

final class ModelData: ObservableObject {
    @StateObject var locationManager = LocationManager()
    @Published var filters: [FilterView] = [FilterView()]
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.22519611440112, longitude: 8.944871184349218), latitudinalMeters: 1000, longitudinalMeters: 1000)
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
//    @Published var region2 = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLatitude, longitude: userLongitude), latitudinalMeters: 1000, longitudinalMeters: 1000)
}


struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
