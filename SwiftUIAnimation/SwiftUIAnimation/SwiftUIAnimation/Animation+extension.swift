//
//  Animation+extension.swift
//  SwiftUIAnimation
//
//  Created by liuhongli on 2024/3/23.
//

//import SwiftUI
//
//
/////******=====线性动画
//
//
//extension Animation {
//    /// 线性
//    public static var liner(duration: TimeInterval) -> Animation
//    /// 渐进
//    public static var easeIn(duration: TimeInterval) -> Animation
//    /// 减速
//    public static var easeOut(duration: TimeInterval) -> Animation
//    /// 渐进减速
//    public static var easeInOut(duration: TimeInterval) -> Animation
//    
//    ///  所有的时间曲线动画都需要指定一个曲线,用于定义动画的速度以及一个持续时间
//    func timingCurve(_ curve: UnitCurve, duration: TimeInterval) -> Animation
//    
//}
//
///// 时间曲线能使用贝塞尔控制点创建
////public struct UnitCurve {
////    
////    public static func bezier(
////        startControlPoint: UnitPoint,
////        endControlPoint: UnitPoint,
////    ) -> UnitCurve
////    
////}
//
//let curve = UnitCurve(startControlPoint: UnitPoint(x: 0.25, y: 0.1), endControlPoint: UnitPoint(x: 0.25, y: 1))
//
//curve.value(at: 0.25)
//
//curve.velocity(at: 0.25)
//
//
//
//
/////******=====弹簧动画
//
//
//extension Animation {
//    /// 弹簧
//    public static var spring(
//        _ spring: Spring, blendDuration: TimeInterval = 0
//    ) -> Animation
//    
//    ///  所有的时间曲线动画都需要指定一个曲线,用于定义动画的速度以及一个持续时间
//    
//    
//    /// 质量,刚度,阻尼(传统弹簧动画参数)
//    public init(
//        mass: Double, stffness: Double, damping: Double
//    )
//    
//    /// 动画的感知持续时间和弹簧的弹性程度(SwiftUI的弹簧动画参数)
//    public init(
//        duration: TimeInterval, bounce: Double = 0
//    )
//    
//}
//
//
/////  在指定时间点计算弹簧的值和速度
//let spring = Spring(duration: 1, bounce: 0)
//spring.value(target: 1, time: 0.25)
//spring.velocity(target: 1, time: 0.25)
//
///// SwiftUI内置的三种弹簧预设
//extension Animation {
//    /// 平滑: 没有弹跳
//    public static var smooth(duration: TimeInterval, extraBounce: Double) -> Animation
//    /// 跳跃: 轻微弹跳
//    public static var snappy(duration: TimeInterval, extraBounce: Double) -> Animation
//    /// 弹力: 较多弹跳
//    public static var bouncy(duration: TimeInterval, extraBounce: Double) -> Animation
//}
//
//
//
/////******===== 修改基础动画的高阶动画
//
//
//extension Animation {
//    /// 速度: 可以加快或放慢
//    public func speed(_ speed: Double) -> Animation
//    /// 并能在基础动画开始之前添加延迟
//    public func delay(_ delay: TimeInterval) -> Animation
//    /// 还可以重复基础动画任意次数, 并在正向播放和反向播放之间切换
//    public func repeatCount(
//        _ repeatCount: Int, autoreverses: Bool = true
//    ) -> Animation
//    
//    
//    ///  所有的时间曲线动画都需要指定一个曲线,用于定义动画的速度以及一个持续时间
//    
//    
//    /// 质量,刚度,阻尼(传统弹簧动画参数)
//    public init(
//        mass: Double, stffness: Double, damping: Double
//    )
//    
//    /// 动画的感知持续时间和弹簧的弹性程度(SwiftUI的弹簧动画参数)
//    public init(
//        duration: TimeInterval, bounce: Double = 0
//    )
//    
//}
//
//
/////******=====CustomAnimation: 自定义动画
//
//// CustomAnimation协议可以访问我们用于实现SwiftUI中所有内置动画的相同低级泛化的入口点
//
//
///// CustomAnimation有三个要求:
//
///// animate: 重点
///// velocity: 可选
///// shouldMerge: 可选
//
//@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
//public protocol CustomAnimation : Hashable {
//
//    /// Calculates the value of the animation at the specified time.
//    ///
//    /// Implement this method to calculate and return the value of the
//    /// animation at a given point in time. If the animation has finished,
//    /// return `nil` as the value. This signals to the system that it can
//    /// remove the animation.
//    ///
//    /// If your custom animation needs to maintain state between calls to the
//    /// `animate(value:time:context:)` method, store the state data in
//    /// `context`. This makes the data available to the method next time
//    /// the system calls it. To learn more about managing state data in a
//    /// custom animation, see ``AnimationContext``.
//    ///
//    /// - Parameters:
//    ///   - value: The vector to animate towards. 这个值向量来自于视图的可动画数据, 在宠物视图中就是 scaleEffect
//    ///   - time: The elapsed time since the start of the animation. 动画开始以来所经过的时间
//    ///   - context: An instance of ``AnimationContext`` that provides access 包含其它动画状态的上下文信息
//    ///   to state and the animation environment.
//    /// - Returns: The current value of the animation, or `nil` if the 返回当前动画的值, 如果动画已经结束则返回nil
//    ///   animation has finished.
//    func animate<V>(value: V, time: TimeInterval, context: inout AnimationContext<V>) -> V? where V : VectorArithmetic
//
//    /// Calculates the velocity of the animation at a specified time.
//    ///
//    /// Implement this method to provide the velocity of the animation at a
//    /// given time. Should subsequent animations merge with the animation,
//    /// the system preserves continuity of the velocity between animations.
//    ///
//    /// The default implementation of this method returns `nil`.
//    ///
//    /// > Note: State and environment data is available to this method via the
//    /// `context` parameter, but `context` is read-only. This behavior is
//    /// different than with ``animate(value:time:context:)`` and
//    /// ``shouldMerge(previous:value:time:context:)-7f4ts`` where `context` is
//    /// an `inout` parameter, letting you change the context including state
//    /// data of the animation. For more information about managing state data
//    /// in a custom animation, see ``AnimationContext``.
//    ///
//    /// - Parameters:
//    ///   - value: The vector to animate towards.
//    ///   - time: The amount of time since the start of the animation.
//    ///   - context: An instance of ``AnimationContext`` that provides access
//    ///   to state and the animation environment.
//    /// - Returns: The current velocity of the animation, or `nil` if the
//    ///   animation has finished.
//    func velocity<V>(value: V, time: TimeInterval, context: AnimationContext<V>) -> V? where V : VectorArithmetic
//
//    /// Determines whether an instance of the animation can merge with other
//    /// instance of the same type.
//    ///
//    /// When a view creates a new animation on an animatable value that already
//    /// has a running animation of the same animation type, the system calls
//    /// the `shouldMerge(previous:value:time:context:)` method on the new
//    /// instance to determine whether it can merge the two instance. Implement
//    /// this method if the animation can merge with another instance. The
//    /// default implementation returns `false`.
//    ///
//    /// If `shouldMerge(previous:value:time:context:)` returns `true`, the
//    /// system merges the new animation instance with the previous animation.
//    /// The system provides to the new instance the state and elapsed time from
//    /// the previous one. Then it removes the previous animation.
//    ///
//    /// If this method returns `false`, the system doesn't merge the animation
//    /// with the previous one. Instead, both animations run together and the
//    /// system combines their results.
//    ///
//    /// If your custom animation needs to maintain state between calls to the
//    /// `shouldMerge(previous:value:time:context:)` method, store the state
//    /// data in `context`. This makes the data available to the method next
//    /// time the system calls it. To learn more, see ``AnimationContext``.
//    ///
//    /// - Parameters:
//    ///   - previous: The previous running animation.
//    ///   - value: The vector to animate towards.
//    ///   - time: The amount of time since the start of the previous animation.
//    ///   - context: An instance of ``AnimationContext`` that provides access
//    ///   to state and the animation environment.
//    /// - Returns: A Boolean value of `true` if the animation should merge with
//    ///   the previous animation; otherwise, `false`.
//    func shouldMerge<V>(previous: Animation, value: V, time: TimeInterval, context: inout AnimationContext<V>) -> Bool where V : VectorArithmetic
//}
