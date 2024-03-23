//
//  MapView_AppleCase.swift
//  Map
//
//  Created by liuhongli on 2024/3/23.
//

import SwiftUI
import MapKit

struct MapView_AppleCase: View {
    
    @State var position: MapCameraPosition = .automatic
    
    @State var searchResults: [MKMapItem] = []
    
    @State var visiableRegion: MKCoordinateRegion?// = .hangzhou
    
    @State var selectedResult: MKMapItem?
    
    @State var route: MKRoute?
    
    
    var body: some View {
        
        Map (position: $position, selection: $selectedResult) {
            Annotation("Parking", coordinate: .coordinate_case) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.background)
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.secondary, lineWidth: 5)
                    Image(systemName: "car")
                        .padding(5)
                }
            }
            .annotationTitles(.visible)
            
            ForEach(searchResults, id: \.self) { result in
                Marker(item: result)
            }
            .annotationTitles(.hidden)
            
            UserAnnotation()
            
            if let route {
                MapPolyline(route)
                    .stroke(.blue, lineWidth: 5)
            }
            
            
        }
        .mapStyle(.standard(elevation: .realistic))
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
                
                
                VStack(spacing: 0) {
                    
                    if let selectedResult {
                        ItemInfoView(selectedResult: selectedResult, route: route)
                            .frame(height: 128)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding([.top, .horizontal])
                    }
                    
                    BeantownButtons(position: $position, searchResults: $searchResults, visiableRegion: visiableRegion)
                        .padding(.top)
                }
                
                Spacer()
            }
            .background(.thinMaterial)
        }
        .onChange(of: searchResults) { oldValue, newValue in // 发生变更时通知
            position = .automatic
        }
        .onChange(of: searchResults) { oldValue, newValue in // 发生变更时通知
            getDirections()
        }
        .onMapCameraChange { context in // 在可见范围内发生变更时通知
            visiableRegion = context.region
        }
        .mapControls {
            MapUserLocationButton()
            MapCompass()
            MapScaleView()
        }
        
    }
    
    
    func getDirections() {
        
        route = nil
        guard let selectedResult else { return }
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: .coordinate_case))
        request.destination = selectedResult
        Task {
            let directions = MKDirections(request: request)
            let response = try? await directions.calculate()
            route = response?.routes.first
        }
    }
}

#Preview {
    MapView_AppleCase()
}
