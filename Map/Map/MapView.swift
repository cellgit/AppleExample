//
//  MapView.swift
//  Map
//
//  Created by liuhongli on 2024/3/23.
//

/*
 https://developer.apple.com/videos/play/wwdc2023/10043/
 */


import SwiftUI
import MapKit

struct MapView: View {
    
    @Namespace var namespace
    
    
    var body: some View {
        
        /* 示例以:
         使用MapContentBuilder创建地图
         
         MapCameraBounds:
         minimumDistance指的是相机距离地面的最小距离。在此距离内，用户无法进一步放大地图视图。
         maximumDistance指的是相机距离地面的最大距离。在此距离外，用户无法进一步缩小地图视图。
         */
        Map(position: .constant(.position_case), bounds: .bounds_case) {
            UserAnnotation()
            Annotation("房源", coordinate: .coordinate_case) {
                // house.and.flag.fill
                // mappin.and.ellipse.circle.fill
                Image(systemName: "house.and.flag.fill")
                    .foregroundColor(.blue)
            }
            .annotationTitles(.visible)
        }
        
        
    }
}

#Preview {
    MapView()
}
