//
//  NekoRequestListItemView.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import SwiftUI



struct NekoRequestListItemView: View {
    @State private var request: NekoRequest
    
    public init(request: NekoRequest) {
        self.request  = request
    }

    var body: some View {
        NekoLabelView(method: request.http.method, name: request.name, useSpacer: true)
    }
}

#Preview {
    let items: [NekoItem] = [
        .request(NekoRequest(name: "GetAll")),
        .request(NekoRequest(name: "GetBy")),
        .folder(NekoFolder(name: "-")),
        .request(NekoRequest(name: "Create User", http: NekoHttp(url: "", method: "POST"))),
        .request(NekoRequest(name: "Update User", http: NekoHttp(url: "", method: "PUT"))),
        .request(NekoRequest(name: "Partial Update User", http: NekoHttp(url: "", method: "PATCH"))),
        .request(NekoRequest(name: "Delete User", http: NekoHttp(url: "", method: "DELETE"))),
        .request(NekoRequest(name: "Delete User", http: NekoHttp(url: "", method: "OPTIONS"))),
        .request(NekoRequest(name: "Delete User", http: NekoHttp(url: "", method: "GARYASCUY")))
    ]
    
    List(items, children: \.items) { item in
        switch(item) {
        case .folder:
            Spacer()
        case .request(let request):
            NekoRequestListItemView(request: request)
        }
    }
    .listStyle(.sidebar)
    .frame(width: 300, height: 500)
    .navigationTitle("Neko Request List Item")
}
