//
//  String.swift
//  NekoGui
//
//  Created by Gary Ascuy on 3/05/25.
//

extension String {
    func leftPadding(toLength: Int, withPad: Character) -> String {
        if count >= toLength {
            return self
        }
        
        return String(repeating: withPad, count: toLength - count) + self
    }
}
