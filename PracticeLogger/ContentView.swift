import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            PracticeListView()
                .tabItem {
                    Label("Practice", systemImage: "music.note.list")
                }

            HistoryListView()
                .tabItem {
                    Label("History", systemImage: "book.pages")
                }

            Text("Another View")
                .tabItem {
                    Label("Setting", systemImage: "gearshape")
                }
        }
    }
}
