//
//  HistoryDetailView.swift
//  PracticeLogger
//
//  Created by Sangwook Lee on 3/23/24.
//

import SwiftUI

struct HistoryDetailView: View {
    let item: History

    var body: some View {
        VStack {
            Text("Details for History:")
            Text("Timestamp: \(item.timestamp)")
        }
        .navigationTitle("History")
    }
}
