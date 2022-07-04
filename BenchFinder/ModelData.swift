//
//  ModelData.swift
//  BenchFinder
//
//  Created by Dominik Helbling on 21.06.22.
//
import SwiftUI
import MapKit

final class ModelData: ObservableObject {
    @Published var locationManager = LocationManager()
    @Published var filters: [FilterView] = [FilterView()]
    @Published var nodes: [Node] = [Node]()
    @Published var currentregion = MKCoordinateRegion()
    @Published var loadingData = false
}
