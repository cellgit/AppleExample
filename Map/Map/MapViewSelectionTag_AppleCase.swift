//
//  MapView_AppleCase_SelectionTag.swift
//  Map
//
//  Created by liuhongli on 2024/3/23.
//

import SwiftUI
import MapKit

struct MapView_AppleCase_SelectionTag: View {
    
    @State private var selectedTag: Int?
    
    @State private var mapItem: MKMapItem = .init(placemark: MKPlacemark.init(coordinate: .coordinate_case))
    
    
    var body: some View {
        
        
        Map (selection: $selectedTag) {
            Marker(item: mapItem)
                .tag(1)
            
            Marker("Not a Item", coordinate: .place)
                .tag(2)
            
        }
        
    }
}

#Preview {
    MapView_AppleCase_SelectionTag()
}
