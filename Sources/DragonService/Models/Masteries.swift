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
    public let tree: MasteriesTree
    public let data: [String: MasteriesDatum]
}

public struct MasteriesDatum: Codable {
    public let id: Int
    public let name: String
    public let description: [String]
    public let image: Image
    public let ranks: Int
    public let prereq: String
}

public struct MasteriesTree: Codable {
    public let ferocity, cunning, resolve: [[Cunning]]

    public enum CodingKeys: String, CodingKey {
        case ferocity = "Ferocity"
        case cunning = "Cunning"
        case resolve = "Resolve"
    }
}

public struct Cunning: Codable {
    public let masteryID, prereq: String

    public enum CodingKeys: String, CodingKey {
        case masteryID = "masteryId"
        case prereq
    }
}
