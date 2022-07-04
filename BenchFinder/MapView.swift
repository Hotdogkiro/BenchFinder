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

    var body: some View {
        Map(
            coordinateRegion: $modelData.locationManager.region,
            interactionModes: MapInteractionModes.all,
            showsUserLocation: true,
            annotationItems: modelData.nodes,
            annotationContent: { node in
                MapMarker(coordinate: node.location, tint: .red)
            }
        ).disabled(modelData.loadingData)
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
