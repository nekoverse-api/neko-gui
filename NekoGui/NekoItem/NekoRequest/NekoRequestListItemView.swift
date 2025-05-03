//
//  NekoRequestListItemView.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import SwiftUI

func getAliasAndColor(method: String) -> (String, Color) {
    return switch method {
    case "GET": ("GET", NekoColor.get)
    case "POST": ("POST", NekoColor.post)
    case "PUT": ("PUT", NekoColor.put)
    case "PATCH": ("PATCH", NekoColor.patch)
    case "DELETE": ("DEL", NekoColor.delete)

    case "HEAD": ("HEAD", NekoColor.unknown)
    case "OPTIONS": ("OPT", NekoColor.unknown)
    case "CONNECT": ("CON", NekoColor.unknown)
    case "TRACE": ("TRACE", NekoColor.unknown)
    
    default: (String(method.prefix(3)),  NekoColor.unknown)
    }
}

struct NekoRequestListItemView: View {
    @State private var request: NekoRequest
    
    public init(request: NekoRequest) {
        self.request  = request
    }
    
    var body: some View {
        let method = request.http.method.uppercased()
        let (alias, color) = getAliasAndColor(method: method)
        NekoRequestListItemBodyView(method: alias, name: request.name, color: color)
    }
}

#Preview {
    let items: [NekoItem] = [
        .request(NekoRequest(name: "GetAll")),
        .request(NekoRequest(name: "GetBy")),
        .folder(NekoFolder(name: "-")),
        .request(NekoRequest(
            name: "Create User",
            http: NekoHttp(url: "", method: "POST")
        )),
        .request(NekoRequest(
            name: "Update User",
            http: NekoHttp(url: "", method: "PUT")
        )),
        .request(NekoRequest(
            name: "Partial Update User",
            http: NekoHttp(url: "", method: "PATCH")
        )),
        .request(NekoRequest(
            name: "Delete User",
            http: NekoHttp(url: "", method: "DELETE")
        )),
        .request(NekoRequest(
            name: "Delete User",
            http: NekoHttp(url: "", method: "OPTIONS")
        )),
        .request(NekoRequest(
            name: "Delete User",
            http: NekoHttp(url: "", method: "GARYASCUY")
        ))
    ]
    
    List(items, children: \.items) { item in
        switch(item) {
        case .folder:
            Spacer()
        case .request(let request):
            NekoRequestListItemView(request: request)
        }
    }
    .frame(width: 300, height: 500)
    .navigationTitle("Neko Request List Item")
}
