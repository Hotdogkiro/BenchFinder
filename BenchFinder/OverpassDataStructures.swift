//
//  OverpassDataStructures.swift
//  BenchFinder
//
//  Created by Dominik Helbling on 04.07.22.
//

import Foundation
import MapKit

struct OverpassBoundingBox: CustomStringConvertible {
    var pointOne = CLLocationCoordinate2D()
    var pointTwo = CLLocationCoordinate2D()
    
    init(region: MKCoordinateRegion){
        self.pointOne.longitude = region.center.longitude - (0.5 * region.span.longitudeDelta)
        self.pointOne.latitude = region.center.latitude - (0.5 * region.span.latitudeDelta)
        self.pointTwo.longitude = region.center.longitude + (0.5 * region.span.longitudeDelta)
        self.pointTwo.latitude = region.center.latitude + (0.5 * region.span.latitudeDelta)
    }
    
    var description: String {
        return "(\(pointOne.latitude), \(pointOne.longitude), \(pointTwo.latitude), \(pointTwo.longitude))"
    }
}

struct Node: Identifiable {
    let id = UUID()
    var lat: Double
    var lon: Double
    var location: CLLocationCoordinate2D { CLLocationCoordinate2D(latitude: lat, longitude: lon ) }
}
