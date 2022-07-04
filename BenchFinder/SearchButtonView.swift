//
//  SearchButtonView.swift
//  BenchFinder
//
//  Created by Dominik Helbling on 22.06.22.
//

import SwiftUI
import SwiftOverpassAPI

struct SearchButtonView: View {
    @EnvironmentObject var modelData: ModelData
    
    private func fetchData(){
        let boundingBoxString = OPBoundingBox(region: modelData.region).toString()
        let query = """
                data=[out:json];
                node["network"="BART"]
                ["railway"="stop"]
                \(boundingBoxString)
                ->.bartStops;
                (
                way(around.bartStops:200)["amenity"="cinema"];
                node(around.bartStops:200)["amenity"="cinema"];
                );
                out center;
                """
        let client = OPClient() //1
        client.endpoint = .custom(urlString: "https://overpass-api.de/api/interpreter") //2
        client.fetchElements(query: query) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let elements):
                print("elements:\(elements)") // Do something with returned the elements
            }
        }
    }

    var body: some View {
        Button(action: {
            fetchData()
            print("Modeldata: \(modelData.region)")
        }){
            Image(systemName: "magnifyingglass")
                .padding()
                .background(.white)
                .frame(height: 40)
                .clipShape(Circle())
                .foregroundColor(.black)
        }
    }
}

struct SearchButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SearchButtonView()
    }
}
