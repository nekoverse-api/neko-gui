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
                    NekoFolderListItemView(folder: folder)
                case .request(let request):
                    NekoRequestListItemView(request: request)
                }
            }
            .toolbar(removing: .sidebarToggle)
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
                Text("") //VSCodeTabsView()
            }
        } detail: {
            Spacer()
                .navigationSplitViewColumnWidth(0)
        }
    }
}

#Preview {
    let collection = NekoCollection(name: "test", items: [
        .folder(NekoFolder(name: "Users", items: [
            .request(NekoRequest(name: "Get All Users", http: NekoHttp(url: "", method: "GET"))),
            .request(NekoRequest(name: "Create User", http: NekoHttp(url: "", method: "POST"))),
            .request(NekoRequest(name: "Delete User", http: NekoHttp(url: "", method: "DELETE")))
        ])),
        .folder(NekoFolder(name: "Pets", items: [
            .request(NekoRequest(name: "Get Pet", http: NekoHttp(url: "", method: "GET"))),
            .request(NekoRequest(name: "Create Pet", http: NekoHttp(url: "", method: "POST"))),
            .request(NekoRequest(name: "Delete Pet", http: NekoHttp(url: "", method: "DELETE")))
        ])),
        .request(NekoRequest(name: "Get All Items", http: NekoHttp(url: "", method: "GET"))),
        .request(NekoRequest(name: "Create Item", http: NekoHttp(url: "", method: "POST"))),
        .request(NekoRequest(name: "Delete Item", http: NekoHttp(url: "", method: "DELETE")))
    ])
    
    NekoCollectionView(collection: collection)
        .frame(minWidth: 700, minHeight: 400)
        .navigationTitle("Neko Collection")
}
