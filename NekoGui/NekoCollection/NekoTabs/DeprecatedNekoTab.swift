//
//  NekoTab.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import SwiftUI

struct DeprecatedNekoTab<NekoLabel: View>: View {
    let label: NekoLabel
    
    @State private var request: NekoRequest
    
    @State private var active = false
    @State private var activeClose = false
    @State private var activeTab = false
    
    public init(request: NekoRequest, @ViewBuilder content: () -> NekoLabel) {
        self.request = request
        self.label = content()
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                print("selected")
            }) { label }
            .buttonStyle(.borderless)
            .onHover { activeTab = $0 }

            Button(action: {
                print("close")
            }) { Image(systemName: "xmark") }
            .padding(2)
            .buttonStyle(.borderless)
            .fontWeight(.bold)
            .background(activeClose ? .gray.opacity(0.2) : .clear)
            .foregroundColor(active ? .gray : .gray.opacity(0.0))
            
            .onHover { activeClose = $0 }
            
            Divider()
                .frame(width: 1, height: 15)
                .opacity(activeTab ? 0 : 1)
        }
        .padding(.horizontal, 5)
        .background(activeTab ? .gray.opacity(0.2) : .clear)
        .onHover { active = $0 }
        
    }
}

#Preview {
    let requests = [
        NekoRequest(name: "Get User", http: NekoHttp(url: "", method: "GET")),
        NekoRequest(name: "Update User", http: NekoHttp(url: "", method: "POST")),
        NekoRequest(name: "Delete User", http: NekoHttp(url: "", method: "DELETE"))
    ]
    
    VStack(spacing: 0) {
        HStack(spacing: 0) {
            Button(action: {
                print("left")
            }) {
                Image(systemName: "chevron.left")
                    .padding(5)
            }
            .buttonStyle(.borderless)
            
            Divider()
                .frame(height: 15)
            
            Button(action: {
                print("right")
            }) {
                Image(systemName: "chevron.right")
                    .padding(5)
            }
            .buttonStyle(.borderless)
            
            
            ForEach(requests, id: \.id) { request in
                DeprecatedNekoTab(request: request) {
                    NekoRequestListItemView(request: request)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 15)
                }
            }
            Spacer()
        }
        Divider()
        Spacer()
    }
    .frame(minWidth: 700, minHeight: 400)
    .navigationTitle("Neko Tab")
}
