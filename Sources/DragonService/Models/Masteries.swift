//
//  Masteries.swift
//  dragon-service
//
//  Created by James Glenn on 9/4/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

public struct Masteries: Codable {
    public let type, version: String
    public let tree: [String: [[Tree?]]]
    public let data: [String: MasteriesDatum]
}

public struct MasteriesDatum: Codable {
    public let id: Int
    public let name: String
    public let description: [String?]
    public let image: Image
    public let ranks: Int
    public let prereq: String
}

public struct Tree: Codable {
    public let masteryID, prereq: String

    public enum CodingKeys: String, CodingKey {
        case masteryID = "masteryId"
        case prereq
    }
}
