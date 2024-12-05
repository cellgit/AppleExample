//
//  SwiftUIPerformance.swift
//  SwiftUIAnimation
//
//  Created by liuhongli on 2024/3/23.
//


/* 揭秘SwiftUI性能:
 https://developer.apple.com/videos/play/wwdc2023/10160
 
 Demystify SwiftUI performance
 Learn how you can build a mental model for performance in SwiftUI and write faster, more efficient code. We'll share some of the common causes behind performance issues and help you triage hangs and hitches in SwiftUI to create more responsive views in your app.
 
 
 翻译:
 揭开 SwiftUI 性能之谜
 学习如何在 SwiftUI 中构建一个有关性能的心智模型，并编写更快、更高效的代码。我们将分享一些性能问题背后的常见原因，并帮助你对 SwiftUI 中的卡顿和延迟进行分类处理，以便在你的应用中创建更加响应灵敏的视图。
 
 */

import SwiftUI

struct SwiftUIPerformance: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SwiftUIPerformance()
}
