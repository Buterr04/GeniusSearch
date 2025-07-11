//
//  ContentView.swift
//  GeniusSearch
//
//  Created by 戴国瑞 on 2025/7/11.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var reports: [Report]
    
    @State private var inputText = ""
    @State private var isLoading = false
    @State private var resultText = ""

    var body: some View {
        NavigationSplitView {
            List {
                Section("历史报告") {
                    ForEach(reports) { report in
                        NavigationLink(destination: Text(report.content).padding()) {
                            Text(report.title)
                        }
                    }
                }
            }
            .navigationTitle("GeniusSearch")
        } detail: {
            VStack(alignment: .leading, spacing: 16) {
                Text("AI 自动搜索与报告生成")
                    .font(.title2)
                    .bold()
                
                TextField("请输入你的研究主题或问题", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: generateReport) {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text("开始搜索并生成报告")
                            .bold()
                    }
                }
                .disabled(inputText.isEmpty || isLoading)
                
                ScrollView {
                    Text(resultText)
                        .padding()
                        .font(.system(.body, design: .monospaced))
                }
                
                if !resultText.isEmpty {
                    Button("保存为历史报告") {
                        let newReport = Report(title: inputText, content: resultText)
                        context.insert(newReport)
                        inputText = ""
                        resultText = ""
                    }
                }

                Spacer()
            }
            .padding()
        }
    }

    func generateReport() {
        isLoading = true
        resultText = "🔍 正在生成内容..."
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let output = """
            # GeniusSearch 报告

            **关键词**：\(inputText)

            - 自动摘要结果
            - 推荐链接
            - 总结与分析
            """
            DispatchQueue.main.async {
                self.resultText = output
                self.isLoading = false
            }
        }
    }
}
