//
//  NekoLeftRigthView.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import SwiftUI

func onNekoLeftRigthViewIdentity() {}

struct NekoLeftRigthView: View {
    private let hoverColor: Color

    private let onLeft: () -> Void
    private let onRight: () -> Void

    @State private var hoveredLeft = false
    @State private var hoveredRight = false

    public init(onLeft: @escaping @MainActor () -> Void = onNekoLeftRigthViewIdentity, onRight: @escaping @MainActor () -> Void = onNekoLeftRigthViewIdentity, hoverColor: Color = .gray.opacity(0.2)) {
        self.onLeft = onLeft
        self.onRight = onRight
        
        self.hoverColor = hoverColor
    }

    var body: some View {
        HStack(spacing: 0) {
            Button(action: onLeft) {
                Image(systemName: "chevron.left")
                    .padding(5)
            }
            .buttonStyle(.borderless)
            .background(hoveredLeft ? hoverColor : .clear)
            .onHover { hoveredLeft = $0 }
            
            Divider()
                .frame(height: 15)

            Button(action: onRight) {
                Image(systemName: "chevron.right")
                    .padding(5)
            }
            .buttonStyle(.borderless)
            .background(hoveredRight ? hoverColor : .clear)
            .onHover { hoveredRight = $0 }
        }
    }
}

#Preview {
    VStack {
        NekoLeftRigthView()
    }
    .padding(20)
    .frame(maxWidth: .infinity, alignment: .leading)
    .navigationTitle("Neko Left Rigth")
}
