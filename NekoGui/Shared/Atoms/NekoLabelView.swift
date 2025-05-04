//
//  NekoLabelView.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import SwiftUI

struct NekoLabelView: View {
    private var method: String
    private var name: String
    private var color: Color
    private var length: Int
    private var useSpacer: Bool
    
    public init(method: String, name: String, length: Int = 5, withPad: Character = " ", useSpacer: Bool = true) {
        let (alias, color) = NekoUtils.getHttpMethodAliasAndColor(method: method)
        
        self.method = alias.leftPadding(toLength: length, withPad: withPad)
        self.name = name
        self.color = color
        self.length = length
        self.useSpacer = useSpacer
    }
    
    var body: some View {
        HStack {
            Text(method)
                .font(.caption.monospaced())
                .foregroundColor(color)
                .lineLimit(1)
            Text(name)
                .lineLimit(1)
            
            if useSpacer {
                Spacer()
            }
        }
    }
}

#Preview {
    VStack {
        VStack {
            NekoLabelView(method: "GET", name: "Get User")
            NekoLabelView(method: "POST", name: "Get User")
            NekoLabelView(method: "PUT", name: "Get User")
            NekoLabelView(method: "PATCH", name: "Get User")
            NekoLabelView(method: "DELETE", name: "Get User")
        }
        .padding(10)
        
        VStack {
            NekoLabelView(method: "GET", name: "Get User", useSpacer: false)
            NekoLabelView(method: "POST", name: "Get User", useSpacer: false)
            NekoLabelView(method: "PUT", name: "Get User", useSpacer: false)
            NekoLabelView(method: "PATCH", name: "Get User", useSpacer: false)
            NekoLabelView(method: "DELETE", name: "Get User", useSpacer: false)
        }
        .padding(10)

        VStack {
            NekoLabelView(method: "POST", name: "Create User", length: 10, withPad: "x")
            NekoLabelView(method: "POST", name: "Create User", length: 10, withPad: "x")
            NekoLabelView(method: "GET", name: "Get User", length: 10, withPad: "x")
            NekoLabelView(method: "OPTIONS", name: "Get User", length: 10, withPad: "x")
        }
        .padding(10)
    }
    .padding(20)
    .frame(maxWidth: .infinity, alignment: .leading)
    .navigationTitle("Neko Request List Item")
}
