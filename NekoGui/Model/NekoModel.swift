//
//  NekoModel.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import Foundation

struct NekoCollection: Identifiable, Hashable {
    var id = UUID()
    var name: String?
    
    var items: [NekoItem] = []
}

struct NekoFolder: Identifiable, Hashable {
    var id = UUID()
    var name: String
    
    var items: [NekoItem] = []
}

struct NekoRequest: Identifiable, Hashable {
    var id = UUID()
    var name: String
}

enum NekoItem: Identifiable, Hashable {
    var id: Self {
        self
    }
    
    case folder(NekoFolder)
    case request(NekoRequest)
}
