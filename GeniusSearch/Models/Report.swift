//
//  Report.swift
//  GeniusSearch
//
//  Created by 戴国瑞 on 2025/7/11.
//

import Foundation
import SwiftData

@Model
class Report: Identifiable {
    var id: UUID
    var title: String
    var content: String
    var createdAt: Date

    init(title: String, content: String, createdAt: Date = Date()) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.createdAt = createdAt
    }
}
