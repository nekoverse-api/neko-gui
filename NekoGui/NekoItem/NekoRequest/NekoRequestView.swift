//
//  NekoRequest.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import SwiftUI

struct NekoRequestView: View {
    @State private var request: NekoRequest
    
    public init(request: NekoRequest) {
        self.request  = request
    }
    
    var body: some View {
        Text("Request: " + request.id.uuidString)
    }
}

#Preview {
    let requestData = NekoRequest(name: "Create User")
    
    NekoRequestView(request: requestData)
        .frame(minWidth: 700, minHeight: 400)
        .navigationTitle("Neko Request")
}
