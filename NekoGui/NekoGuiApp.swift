//
//  NekoGuiApp.swift
//  NekoGui
//
//  Created by Gary Ascuy on 20/04/25.
//

import SwiftUI

@main
struct NekoGuiApp: App {
    var collection = NekoCollection(name: "test", items: [
        .folder(NekoFolder(name: "Users")),
        .folder(NekoFolder(name: "Pets")),
        .request(NekoRequest(name: "Create User")),
        .request(NekoRequest(name: "Delete User"))
    ])
    
    var body: some Scene {
        WindowGroup {
            NekoCollectionView(collection: collection)
        }
    }
}
