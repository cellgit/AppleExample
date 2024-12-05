//
//  AnimateWithSpring.swift
//  SwiftUIAnimation
//
//  Created by liuhongli on 2024/3/23.
//

/* 弹簧动画
 https://developer.apple.com/videos/play/wwdc2023/10158
 两个参数: 持续时间和反弹
 duration: 持续时间
 
 bounce: 反弹,增加反弹会使动画反弹,
 当弹性大于0时,会得到一个有弹性的弹簧动画,他会超过目标位置 (欠阻尼: UnderDamped), 即有弹性: Bouncy, 值: 100%>bounce>0%
 当弹性等于0时,会得到一个平滑的曲线 (临界阻尼: Critically damped), 即平滑: Smooth, 值: bounce=0%
 当弹性小于0时(不常见),会得到一个较长的尾部逐渐接近目标位置,比弹性值为0的要平缓些, (过阻尼: Overdamped) 即平缓: Flattened, 值: 0%>bounce>-100%
 
 */

import SwiftUI

struct AnimateWithSpring: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AnimateWithSpring()
}
