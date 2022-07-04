//
//  Map.swift
//  BenchFinder
//
//  Created by Dominik Helbling on 20.06.22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var modelData: ModelData
    @StateObject var locationManager = LocationManager()
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 12)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 12)"
    }
    
    func setRegion(center: CLLocationCoordinate2D){
        modelData.region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
        
    var body: some View {
        Map(coordinateRegion: $modelData.region)
            .onAppear{
                setRegion(center: CLLocationCoordinate2D(latitude: Double(userLatitude) ?? 0.0, longitude: Double(userLongitude) ?? 0.0))
            }
//        VStack {
//            Text("location status: \(locationManager.statusString)")
//            HStack {
//                Text("latitude: \(userLatitude)")
//                Text("longitude: \(userLongitude)")
//            }
//            Text("Region status: \(locationManager.statusString)")
//            HStack {
//                Text("latitude: \(region.center.latitude)")
//                Text("longitude: \(region.center.longitude)")
//            }
//        }
    }

}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
