//
//  ContentView.swift
//  NekoGui
//
//  Created by Gary Ascuy on 20/04/25.
//

import SwiftUI

struct NekoItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    
    var items: [NekoItem]? = nil
}

struct ContentView: View {
    @State private var collection = [
        NekoItem(name: "Users"),
        NekoItem(name: "Pets"),
        NekoItem(name: "Create User"),
        NekoItem(name: "Delete User")
    ]
    
    @State private var selected: NekoItem?
    @State var query: String = ""
    
    var body: some View {
        NavigationSplitView {
            List(collection, selection: $selected) { item in
                Text(item.name)
            }
            .searchable(text: $query, placement: .toolbar, prompt: Text("Search or Action"))
        } content: {
            if let item = selected {
                Text(item.name)
            } else {
                Text("REQUEST")
            }
        } detail: {
            Text("RESPONSE")
        }
    }
}

#Preview {
    ContentView()
        .frame(minWidth: 700, minHeight: 400)
        .navigationTitle("Neko")
}
