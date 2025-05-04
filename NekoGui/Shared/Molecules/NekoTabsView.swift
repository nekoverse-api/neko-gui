//
//  NekoTabsView.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import SwiftUI

struct NekoTabsView<NekoContent: View>: View {
    private let content: NekoContent
    
    @State private var tabs = []
    
    public init(@ViewBuilder content: () -> NekoContent) {
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                NekoLeftRigthView()
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
                
                Divider()
                    .frame(height: 30)
                
                NekoTabView(isCloseable: true) {
                    NekoLabelView(method: "GET", name: "Get Users", useSpacer: false )
                        .padding(.leading, 5)
                        .padding(.trailing, 10)
                        .padding(.vertical, 15)
                }
                
                NekoTabView(isCloseable: true) {
                    NekoLabelView(method: "POST", name: "Create Users", useSpacer: false )
                        .padding(.leading, 5)
                        .padding(.trailing, 10)
                        .padding(.vertical, 15)
                }
                Spacer()
            }
            
            Divider()
            content
        }
    }
}

#Preview {
    NekoTabsView {
        Spacer()
        Text("BODY")
        Spacer()
    }
    .frame(minWidth: 700, minHeight: 400)
    .navigationTitle("Neko Tabs")
}
