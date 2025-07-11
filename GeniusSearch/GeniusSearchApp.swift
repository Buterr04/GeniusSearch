//
//  GeniusSearchApp.swift
//  GeniusSearch
//
//  Created by 戴国瑞 on 2025/7/11.
//

import SwiftUI
import SwiftData

@main
struct GeniusSearchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Report.self) // SwiftData 数据模型
    }
}
