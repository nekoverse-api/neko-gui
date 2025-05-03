//
//  NekoRequestListItemBodyView.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import SwiftUI

func leftPadding(method: String, toLength: Int, withPad: Character) -> String {
    if method.count >= toLength {
        return method
    }
    
    return String(repeating: withPad, count: toLength - method.count) + method
}

struct NekoRequestListItemBodyView: View {
    private var method: String
    private var name: String
    private var color: Color
    private var length: Int
    
    public init(method: String, name: String, color: Color, length: Int = 5, withPad: Character = " ") {
        self.method = leftPadding(method: method, toLength: length, withPad: withPad)
        self.name = name
        self.color = color
        self.length = length
    }
    
    var body: some View {
        HStack {
            Text(method)
                .font(.caption.monospaced())
                .foregroundColor(color)
                .lineLimit(1)
            Text(name)
                .lineLimit(1)
            Spacer()
        }
    }
}

#Preview {
    VStack {
        VStack {
            NekoRequestListItemBodyView(method: "GET", name: "Get User", color: .green)
            NekoRequestListItemBodyView(method: "POST", name: "Get User", color: .yellow)
            NekoRequestListItemBodyView(method: "PATCH", name: "Get User", color: .orange)
            NekoRequestListItemBodyView(method: "DEL", name: "Get User", color: .red)
        }
        .padding(10)
        
        VStack {
            NekoRequestListItemBodyView(method: "POST", name: "Create User", color: .yellow, length: 10, withPad: "x")
            NekoRequestListItemBodyView(method: "POST", name: "Create User", color: .yellow, length: 10, withPad: "x")
            NekoRequestListItemBodyView(method: "GET", name: "Get User", color: .green, length: 10, withPad: "x")
            NekoRequestListItemBodyView(method: "OPTIONS", name: "Get User", color: .gray, length: 10, withPad: "x")
        }
        .padding(10)
    }
    .padding(20)
    .frame(maxWidth: .infinity, alignment: .leading)
    .navigationTitle("Neko Request List Item")
}
    
