//
//  ItemInfoView.swift
//  Map
//
//  Created by liuhongli on 2024/3/23.
//

import SwiftUI
import MapKit

struct ItemInfoView: View {
    
    @State var selectedResult: MKMapItem = .init(placemark: .init(coordinate: .coordinate_case))
    
    @State var route: MKRoute?
    
    @State private var lookAroundScene: MKLookAroundScene?
    
    func getLookAroundScene() {
        lookAroundScene = nil
        Task {
            let request = MKLookAroundSceneRequest(mapItem: selectedResult)
            lookAroundScene = try? await request.scene
        }
    }
    
    var travelTime: String? {
        
        guard let route else { return nil }
        
        let formatter = DateComponentsFormatter()
        
        formatter.unitsStyle = .abbreviated
        
        formatter.allowedUnits = [.hour, .minute]
        
        return formatter.string(from: route.expectedTravelTime)
    }
    
    
    
    var body: some View {
        LookAroundPreview(initialScene: lookAroundScene)
            .overlay(alignment: .bottomTrailing) {
                Text("\(selectedResult.name)")
                if let travelTime {
                    Text(travelTime)
                }
            }
            .font(.caption)
            .foregroundColor(.white)
            .padding(10)
            .onAppear {
                getLookAroundScene()
            }
            .onChange(of: selectedResult) { oldValue, newValue in
                getLookAroundScene()
            }
        
    }
    
}

#Preview {
    ItemInfoView()
}
