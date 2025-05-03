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
    var id: Self { self }
    var items: [NekoItem]? {
        switch self {
        case .folder(let folder): folder.items
        case .request: nil
        }
    }
    
    case folder(NekoFolder)
    case request(NekoRequest)
}

