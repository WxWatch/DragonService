//
//  Language.swift
//  dragon-service
//
//  Created by James Glenn on 9/4/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

public struct LanguageModel: Codable {
    public let type, version: String
    public let data: [String: String]
    public let tree: LanguageTree
}

public struct LanguageTree: Codable {
    public let searchKeyIgnore: String
    public let searchKeyRemap: [String]
}
