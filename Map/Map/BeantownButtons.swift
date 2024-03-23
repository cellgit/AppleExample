//
//  BeantownButtons.swift
//  Map
//
//  Created by liuhongli on 2024/3/23.
//

import SwiftUI
import MapKit

struct BeantownButtons: View {
    
    @Binding var position: MapCameraPosition
    
    @Binding var searchResults: [MKMapItem]
    
    var visiableRegion: MKCoordinateRegion?
    
    func search(for query: String) {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        
        
        request.resultTypes = .pointOfInterest
        
        request.region =  visiableRegion ?? MKCoordinateRegion(
            center: .coordinate_case,
            span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125)
        )
        
        
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            
            searchResults = response?.mapItems ?? []
            
        }
        
    }
    
    
    
    var body: some View {
        
        HStack {
            Button {
//                search(for: "Playgrounds")
                search(for: "游乐场")
            } label: {
                Label(
                    title: { Text("Playgrounds") },
                    icon: { Image(systemName: "figure.and.child.holdinghands") }
                )
            }
            .buttonStyle(.borderedProminent)
            
            Button {
//                search(for: "Beaches")
                search(for: "沙滩")
            } label: {
                Label(
                    title: { Text("Beaches") },
                    icon: { Image(systemName: "beach.umbrella") }
                )
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                position = .region(.hangzhou)
            } label: {
                Label(
                    title: { Text("杭州") },
                    icon: { Image(systemName: "water.waves") }
                )
            }
            .buttonStyle(.bordered)
            
            Button {
                position = .region(.beijing)
            } label: {
                Label(
                    title: { Text("北京") },
                    icon: { Image(systemName: "building.2") }
                )
            }
            .buttonStyle(.bordered)
            
        }
        .labelStyle(.iconOnly)
        
        
        
    }
    
    
    
    
}

#Preview {
    BeantownButtons(position: .constant(.position_case), searchResults: .constant([MKMapItem.init(placemark: MKPlacemark(coordinate: .coordinate_case))]))
}
