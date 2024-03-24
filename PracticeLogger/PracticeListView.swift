//
//  PracticeListView.swift
//  PracticeLogger
//
//  Created by Sangwook Lee on 3/23/24.
//

import SwiftUI
import SwiftData

struct PracticeListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Practice]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        PracticeDetailView(item: item) { (item: Practice) in
                            item.timestamp = Date()
                            try? modelContext.save()
                        }
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
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Practice(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}
