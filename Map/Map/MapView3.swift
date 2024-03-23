//
//  MapView3.swift
//  Map
//
//  Created by liuhongli on 2024/3/23.
//

import SwiftUI
import MapKit

struct MapView3: View {
    
    @Namespace var namespace
    
    var body: some View {
        Map(position: .constant(.position_case), bounds: .bounds_case, interactionModes: .all, selection: .constant("123"), scope: namespace) {
            UserAnnotation()
        }
    }
}

#Preview {
    MapView3()
}
