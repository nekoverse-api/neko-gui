//
//  NekoFolderListItemView.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import SwiftUI

struct NekoFolderListItemView: View {
    private var folder: NekoFolder
    
    public init(folder: NekoFolder) {
        self.folder  = folder
    }
    
    var body: some View {
        HStack {
            Text(folder.name)
                .padding(.horizontal, 10)
                .lineLimit(1)
            Spacer()
        }
    }
    
}

#Preview {
    let items: [NekoItem] = [
        .folder(NekoFolder(name: "Pets", items: [
            .folder(NekoFolder(name: "Create")),
            .folder(NekoFolder(name: "Update"))
        ])),
        .folder(NekoFolder(name: "Users", items: [
            .folder(NekoFolder(name: "Create")),
            .folder(NekoFolder(name: "Update"))
        ]))
    ]
    
    List(items, children: \.items) { item in
        switch(item) {
        case .folder(let folder):
            NekoFolderListItemView(folder: folder)
        case .request:
            Spacer()
        }
    }
    .listStyle(.sidebar)
    .padding(20)
    .frame(maxWidth: .infinity, alignment: .leading)
    .navigationTitle("Neko Folder List Item")
}
