//
//  NekoRequest.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import SwiftUI
//import CodeEditSourceEditor

struct NekoRequestView: View {
    @State private var request: NekoRequest
    
    public init(request: NekoRequest) {
        self.request  = request
    }
    
    let font = Font.system(size: 15)
    
    
    @State var text = "let x = 1.0"
    //@State var theme = EditorTheme(...)
    @State var fontx = NSFont.monospacedSystemFont(ofSize: 11, weight: .regular)
    @State var tabWidth = 4
    @State var lineHeight = 1.2
    @State var editorOverscroll = 0.3
    
    var body: some View {
        HSplitView {
            
            VStack {
                HStack {
                    TextField(text: $request.http.method) {
                        Text("Method")
                    }.font(font).frame(width: 60)
                    
                    TextField(text: $request.http.url) {
                        Text("Url")
                    }.font(font)
                    
                    Button(action: { print("") }) {
                        Text("Send")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(10)
                
                Divider()
                Spacer()
            }
            .frame(minWidth: 0, idealWidth: 200, minHeight: 0, idealHeight: 200)
            
            
            VStack {
//                CodeEditSourceEditor(
//                    $text,
//                    language: .swift,
//                    theme: $theme,
//                    font: $font,
//                    tabWidth: $tabWidth,
//                    lineHeight: $lineHeight,
//                    editorOverscroll: $editorOverscroll
//                )
                Spacer()
            }
            .frame(minWidth: 0, idealWidth: 200, minHeight: 0, idealHeight: 200)
            
        }
    }
}

#Preview {
    let requestData = NekoRequest(name: "Create User")
    
    NekoRequestView(request: requestData)
        .frame(minWidth: 700, minHeight: 400)
        .navigationTitle("Neko Request")
}
