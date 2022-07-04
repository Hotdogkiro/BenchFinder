//
//  AddFilterButton.swift
//  BenchFinder
//
//  Created by Dominik Helbling on 20.06.22.
//

import SwiftUI

struct FilterView: View, Equatable, Identifiable {
    var id = UUID()
    @State var active: Bool = false
    @State var filter = ""
    
    @EnvironmentObject var modelData: ModelData

    static func == (lhs: FilterView, rhs: FilterView) -> Bool {
        return lhs.id == rhs.id
    }
    
    var body: some View {
        HStack{
            Button(action: {
                active = !active
                if active {
                    modelData.filters.append(FilterView())
                } else {
                    if let index = modelData.filters.firstIndex(of: self){
                        modelData.filters.remove(at: index)
                    }
                }
            }){
                if active {
                    Image(systemName: "minus")
                } else {
                    Image(systemName: "plus")
                }
            }
            .padding()
            .background(.white)
            .frame(height: 40)
            .clipShape(Circle())
            .foregroundColor(.black)
            if active {
                TextField("search...", text: $filter)
                    .padding()
                    .frame(height: 40, alignment: .leading)
                    .background(.white)
                    .cornerRadius(20)
            }
        }
    }
}
