//
//  Language.swift
//  dragon-service
//
//  Created by James Glenn on 9/4/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

struct LanguageModel: Codable {
    let type, version: String
    let data: [String: String]
    let tree: LanguageTree
}

struct LanguageTree: Codable {
    let searchKeyIgnore: String
    let searchKeyRemap: [String]
}
