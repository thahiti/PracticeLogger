//
//  PracticeDetailView.swift
//  PracticeLogger
//
//  Created by Sangwook Lee on 3/23/24.
//

import SwiftUI

struct PracticeDetailView: View {
    let item: Practice
    let updater: (Practice) -> Void
    var body: some View {
        VStack {
            Text("Details for item:")
            Text("Timestamp: \(item.timestamp)")
            Button("change") {
                updater(item)
            }
        }
        .navigationTitle("Item Details")
    }
}

