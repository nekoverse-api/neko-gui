//
//  NekoGuiApp.swift
//  NekoGui
//
//  Created by Gary Ascuy on 20/04/25.
//

import SwiftUI

@main
struct NekoGuiApp: App {
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
    
    var body: some Scene {
        WindowGroup {
            NekoCollectionView(collection: collection)
        }
    }
}
