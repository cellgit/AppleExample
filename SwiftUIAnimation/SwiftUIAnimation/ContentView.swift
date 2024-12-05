//
//  ContentView.swift
//  SwiftUIAnimation
//
//  Created by liuhongli on 2024/3/23.
//

/*
 官网视频:
 https://developer.apple.com/videos/play/wwdc2023/10156
 
 Anatomy of an update: 如何刷新视图的渲染
 Animatable: 使用可动画来确定要进行动画处理的内容,
 Animation: 使用动画来实现随时间进行的插值
 Transaction: 使用事务来传递当前更新的上下文
 
 SwiftUI内置动画效果:
 Time curve:时间曲线动画
 spring: 弹簧动画
 Higher order: 修改基础动画的高阶动画
 
 CustomAnimation: 自定义动画
 
 
 */

import SwiftUI

struct ContentView: View {
    
    @State var selected: Bool = false
    
    var body: some View {
        VStack {
            Avatar(pet: .init(type: .cat), selected: $selected)
                .frame(width: 100)
            
            Avatar(pet: .init(type: .cat), selected: $selected)
                .frame(width: 100)
            
            Avatar(pet: .init(type: .cat), selected: $selected)
                .frame(width: 100)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
