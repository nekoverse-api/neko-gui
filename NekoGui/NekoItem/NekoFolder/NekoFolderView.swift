//
//  NekoFolderView.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//


import SwiftUI

struct NekoFolderView: View {
    @State private var folder: NekoFolder
    
    public init(folder: NekoFolder) {
        self.folder  = folder
    }
    
    var body: some View {
        Text("Folder: " + folder.id.uuidString)
    }
}

#Preview {
    let folderData = NekoFolder(name: "Users", items: [])
    
    NekoFolderView(folder: folderData)
        .frame(minWidth: 700, minHeight: 400)
        .navigationTitle("Neko Folder")
}
