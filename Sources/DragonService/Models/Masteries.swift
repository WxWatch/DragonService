//
//  Masteries.swift
//  dragon-service
//
//  Created by James Glenn on 9/4/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

public struct Masteries: Codable {
    let type, version: String
    let tree: MasteriesTree
    let data: [String: MasteriesDatum]
}

public struct MasteriesDatum: Codable {
    let id: Int
    let name: String
    let description: [String]
    let image: Image
    let ranks: Int
    let prereq: String
}

public struct MasteriesTree: Codable {
    let ferocity, cunning, resolve: [[Cunning]]

    enum CodingKeys: String, CodingKey {
        case ferocity = "Ferocity"
        case cunning = "Cunning"
        case resolve = "Resolve"
    }
}

public struct Cunning: Codable {
    let masteryID, prereq: String

    enum CodingKeys: String, CodingKey {
        case masteryID = "masteryId"
        case prereq
    }
}
