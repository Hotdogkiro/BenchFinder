//
//  BenchFinderApp.swift
//  BenchFinder
//
//  Created by Dominik Helbling on 20.06.22.
//

import SwiftUI

@main
struct BenchFinderApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
