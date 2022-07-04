//
//  SearchButtonView.swift
//  BenchFinder
//
//  Created by Dominik Helbling on 22.06.22.
//

import SwiftUI
import MapKit

struct SearchButtonView: View {
    @EnvironmentObject var modelData: ModelData
    
    private func fetchData(){
        let boundingBoxString = OverpassBoundingBox(region: modelData.locationManager.region)
        let query = """
                data=[out:json];
                node["amenity"="bench"]
                \(boundingBoxString);
                out center;
                """
       
        var url = URLRequest(url: URL(string: "https://overpass-api.de/api/interpreter")!)
        url.httpBody = query.data(using: .utf8)
        url.httpMethod = "post"
        let task = URLSession.shared.dataTask(with: url) {data,resp,error in
            guard let data = data, error == nil else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
                let elements = json?["elements"] as? [[String:Any]] ?? []
                var nodes = [Node]()
                for element in elements {
                    nodes.append(Node(lat: element["lat"] as! Double, lon: element["lon"] as! Double))
                }
                DispatchQueue.main.async {
                    modelData.nodes = nodes
                    modelData.loadingData = false
                }
            } catch {
                print(error)
                DispatchQueue.main.async {
                    modelData.loadingData = false
                }
            }
        }
        modelData.loadingData = true
        task.resume()
    }

    var body: some View {
        Button(action: {
            fetchData()
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
