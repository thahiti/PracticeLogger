//
//  HistoryListView.swift
//  PracticeLogger
//
//  Created by Sangwook Lee on 3/23/24.
//

import SwiftUI
import SwiftData

struct HistoryListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var newItems: [History]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(newItems) { item in
                    NavigationLink {
                        HistoryDetailView(item: item)
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a new item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = History(timestamp: Date())
            modelContext.insert(newItem)
            // You may need additional logic here to ensure the item meets the "new" criteria
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(newItems[index])
            }
        }
    }
}
