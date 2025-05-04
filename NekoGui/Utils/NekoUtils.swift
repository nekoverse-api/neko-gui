//
//  NekoUtils.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

import SwiftUI

struct NekoUtils {
    static func getHttpMethodAliasAndColor(method: String) -> (String, Color) {
        return switch method.uppercased() {
        case "GET": ("GET", NekoColor.get)
        case "POST": ("POST", NekoColor.post)
        case "PUT": ("PUT", NekoColor.put)
        case "PATCH": ("PATCH", NekoColor.patch)
        case "DELETE": ("DEL", NekoColor.delete)
            
        case "HEAD": ("HEAD", NekoColor.unknown)
        case "OPTIONS": ("OPT", NekoColor.unknown)
        case "CONNECT": ("CON", NekoColor.unknown)
        case "TRACE": ("TRACE", NekoColor.unknown)
            
        default: (String(method.prefix(3)),  NekoColor.unknown)
        }
    }
}
