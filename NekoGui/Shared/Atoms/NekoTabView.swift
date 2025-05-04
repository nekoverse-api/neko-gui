//
//  NekoTabView.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import SwiftUI

func onNekoTabEventIdentity() {}

struct NekoTabView<NekoContent: View>: View {
    private let label: NekoContent
    private let isCloseable: Bool
    private let hoverColor: Color

    private let onClick: () -> Void
    private let onClose: () -> Void

    @State private var hoveredTab = false
    @State private var hoveredLabel = false
    @State private var hoveredClose = false

    public init(onClick: @escaping @MainActor () -> Void = onNekoTabEventIdentity, onClose: @escaping @MainActor () -> Void = onNekoTabEventIdentity, hoverColor: Color = .gray.opacity(0.2), isCloseable: Bool = false, @ViewBuilder content: () -> NekoContent) {
        self.label = content()

        self.isCloseable = isCloseable
        self.hoverColor = hoverColor

        self.onClick = onClick
        self.onClose = onClose
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Button(action: onClick) { label }
                .buttonStyle(.borderless)
                .onHover { hoveredLabel = $0 }

            if isCloseable {
                Button(action: onClose) { Image(systemName: "xmark") }
                    .padding(2)
                    .buttonStyle(.borderless)
                    .fontWeight(.bold)
                    .background(hoveredClose ? hoverColor : .clear)
                    .foregroundColor(hoveredTab ? .gray : .clear)
                    .onHover { hoveredClose = $0 }
            }

            Divider()
                .frame(height: 15)
                .opacity(hoveredLabel ? 0 : 1)
        }
        .padding(.horizontal, 5)
        .background(hoveredLabel ? hoverColor : .clear)
        .onHover { hoveredTab = $0 }
        
    }
}

#Preview {
    let requests = [
        NekoRequest(name: "Get User", http: NekoHttp(url: "", method: "GET")),
        NekoRequest(name: "Update User", http: NekoHttp(url: "", method: "POST")),
        NekoRequest(name: "Delete User", http: NekoHttp(url: "", method: "DELETE"))
    ]
    
    let onClose = { print("OnClose") }
    let onClick = { print("OnClick") }
    
    let verticalPadding = 15.0
    let horizontalPadding = 15.0
    
    VStack(spacing: 0) {
        HStack(spacing: 0) {
            ForEach(requests, id: \.id) { request in
                NekoTabView(onClick: onClick, onClose: onClose, isCloseable: true) {
                    NekoLabelView(method: request.http.method, name: request.name, useSpacer: false)
                        .padding(.leading, 5)
                        .padding(.trailing, 10)
                        .padding(.vertical, verticalPadding)
                }
            }
            Spacer()
        }
        Divider()
        Spacer()
        
        HStack(spacing: 0) {
            NekoTabView(onClick: onClick) {
                Text("Params")
                    .padding(.horizontal, horizontalPadding)
                    .padding(.vertical, verticalPadding)
            }
            NekoTabView(onClick: onClick) {
                HStack {
                    Text("Headers")
                    Text("(4)")
                        .foregroundColor(.green.opacity(0.5))
                }
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, verticalPadding)
            }
            NekoTabView(onClick: onClick) {
                Text("Body")
                    .padding(.horizontal, horizontalPadding)
                    .padding(.vertical, verticalPadding)
            }
            NekoTabView(onClick: onClick) {
                Text("Scripts")
                    .padding(.horizontal, horizontalPadding)
                    .padding(.vertical, verticalPadding)
            }
            NekoTabView(onClick: onClick) {
                Text("Settings")
                    .padding(.horizontal, horizontalPadding)
                    .padding(.vertical, verticalPadding)
            }
            Spacer()
        }
        Divider()
        Spacer()
        
    }
    .frame(minWidth: 700, minHeight: 400)
    .navigationTitle("Neko Tab")
}
