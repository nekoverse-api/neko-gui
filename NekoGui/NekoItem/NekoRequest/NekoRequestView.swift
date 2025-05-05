//
//  NekoRequest.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import SwiftUI
//import CodeEditSourceEditor
import CodeEditor

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
    
    @AppStorage("fontsize") var fontSize = Int(NSFont.systemFontSize)
    @State private var source = """
    {
      "name": "test",
      "age": 122,
      "gary": true
    }
    """
    @State private var language = CodeEditor.Language.json
    @State private var theme    = CodeEditor.ThemeName.pojoaque
    
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
                VStack(spacing: 0) {
                    HStack {
                        Picker("Language", selection: $language) {
                            ForEach(CodeEditor.availableLanguages) { language in
                                Text("\(language.rawValue.capitalized)")
                                    .tag(language)
                            }
                        }
                        Picker("Theme", selection: $theme) {
                            ForEach(CodeEditor.availableThemes) { theme in
                                Text("\(theme.rawValue.capitalized)")
                                    .tag(theme)
                            }
                        }
                    }
                    .padding()
                    
                    Divider()
                }
                
                CodeEditor(source: $source, language: language, theme: theme,
                                   fontSize: .init(get: { CGFloat(fontSize)  },
                                                   set: { fontSize = Int($0) }))
//                CodeEditSourceEditor(
//                    $text,
//                    language: .swift,
//                    theme: $theme,
//                    font: $font,
//                    tabWidth: $tabWidth,
//                    lineHeight: $lineHeight,
//                    editorOverscroll: $editorOverscroll
//                )
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
