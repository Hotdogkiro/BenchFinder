//
//  ContentView.swift
//  BenchFinder
//
//  Created by Dominik Helbling on 20.06.22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ZStack{
            MapView()
                .ignoresSafeArea(edges: .top)
            VStack{
                ForEach(modelData.filters){filter in
                    HStack{
                        filter
                        Spacer()
                    }
                }
                Spacer()
                HStack{
                    Spacer()
                    SearchButtonView()
                        .padding()
                }
            }
            if modelData.loadingData {
                Label("Loading", systemImage: "circle.dotted")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
