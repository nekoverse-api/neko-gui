//
//  ContentView.swift
//  NekoGui
//
//  Created by Gary Ascuy on 20/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, neko!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .frame(minWidth: 700, minHeight: 400)
}
