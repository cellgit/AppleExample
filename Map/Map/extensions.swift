//
//  extensions.swift
//  Map
//
//  Created by liuhongli on 2024/3/23.
//

import SwiftUI
import MapKit

/// 样例数据
extension MapCameraPosition {
    static let position_case: MapCameraPosition  = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.0522, longitude: 120.2437), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)))
}

extension CLLocationCoordinate2D {
    static let coordinate_case = CLLocationCoordinate2D(latitude: 40.0522, longitude: 120.2439)
    
    static let place = CLLocationCoordinate2D(latitude: 40.0522, longitude: 120.2437)
}

extension MapCameraBounds {
    static let bounds_case = MapCameraBounds(minimumDistance: 10, maximumDistance: 50000)
}

extension MKCoordinateRegion {
    // 这里是杭州的坐标
    static let hangzhou = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.0522, longitude: 120.2437),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    // 这里是北京的坐标
    static let beijing = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.0522, longitude: 120.2437),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
}
