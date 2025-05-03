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

struct NekoHttp: Codable, Hashable, Identifiable{
    var id = UUID()
    
    var url: String
    var method: String
    var body: String?
    var headers: [String: String] = [:]
    var parameters: [String: String] = [:]
}

struct NekoRequest: Identifiable, Hashable {
    var id = UUID()
    var name: String
    
    var http: NekoHttp = NekoHttp(url: "https://echo.nekoverse.me/api/v1/test", method: "GET")
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

