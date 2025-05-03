//
//  NekoCollectionView.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import SwiftUI

struct NekoCollectionView: View {
    @State private var collection: NekoCollection
    
    @State private var selected: NekoItem?
    @State private var opened: Set<NekoItem> = []
    @State private var query: String = ""
    
    public init(collection: NekoCollection) {
        self.collection = collection
    }
    
    var body: some View {
        NavigationSplitView {
            List(collection.items, children: \.items, selection: $opened) { item in
                switch(item) {
                case .folder(let folder):
                    Text(folder.name)
                case .request(let request):
                    Text(request.name)
                }
            }
            .searchable(text: $query, placement: .toolbar, prompt: Text("Search or Action"))
        } content: {
            if let item = selected {
                switch item {
                case  .folder(let folder):
                    NekoFolderView(folder: folder)
                case .request(let request):
                    NekoRequestView(request: request)
                }
            } else {
                Text("REQUEST & RESPONSE")
                Text("Not selected")
            }
        } detail: {
            Spacer()
                .navigationSplitViewColumnWidth(0)
        }
    }
}

#Preview {
    let collection = NekoCollection(name: "test", items: [
        .folder(NekoFolder(name: "Users")),
        .folder(NekoFolder(name: "Pets")),
        .request(NekoRequest(name: "Create User")),
        .request(NekoRequest(name: "Delete User"))
    ])
    
    NekoCollectionView(collection: collection)
        .frame(minWidth: 700, minHeight: 400)
        .navigationTitle("Neko Collection")
}
