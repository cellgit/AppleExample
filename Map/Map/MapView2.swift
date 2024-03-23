//
//  MapView2.swift
//  Map
//
//  Created by liuhongli on 2024/3/23.
//

import SwiftUI
import MapKit

struct MapView2: View {
    var body: some View {
        Map {
            UserAnnotation()
        }
        .mapStyle(.standard)
//        .mapStyle(
//            .hybrid(elevation: .realistic,
//                    pointsOfInterest: .all,
//                    showsTraffic: true)
//        )
//        .mapStyle(.hybrid(elevation: .realistic))
    }
}

#Preview {
    MapView2()
}
