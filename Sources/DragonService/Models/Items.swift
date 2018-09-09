//
//  Items.swift
//  dragon-service
//
//  Created by James Glenn on 9/3/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation
import Alamofire

public struct ItemsModel: Codable {
    let type, version: String
    let basic: Basic
    let data: [String: ItemsDatum]
    let groups: [GroupElement]
    let tree: [ItemsTree]
}

public struct ItemsDatum: Codable {
    let name, description, colloq, plaintext: String
    let into: [String]
    let image: Image
    let gold: Gold
    let tags: [String]
    let maps: [String: Bool]
    let stats: [String: Double]
    let from: [String]?
    let effect: Effect?
    let depth: Int?
    let consumed: Bool?
    let stacks: Int?
    let inStore, consumeOnFull: Bool?
    let requiredChampion: String?
    let specialRecipe: Int?
    let hideFromAll: Bool?
}

public struct Effect: Codable {
    let effect1Amount: String
    let effect2Amount, effect3Amount, effect4Amount, effect5Amount: String?
    let effect6Amount, effect7Amount, effect8Amount: String?

    enum CodingKeys: String, CodingKey {
        case effect1Amount = "Effect1Amount"
        case effect2Amount = "Effect2Amount"
        case effect3Amount = "Effect3Amount"
        case effect4Amount = "Effect4Amount"
        case effect5Amount = "Effect5Amount"
        case effect6Amount = "Effect6Amount"
        case effect7Amount = "Effect7Amount"
        case effect8Amount = "Effect8Amount"
    }
}

public struct GroupElement: Codable {
    let id: String
    let maxGroupOwnable: String?

    enum CodingKeys: String, CodingKey {
        case id
        case maxGroupOwnable = "MaxGroupOwnable"
    }
}

public struct ItemsTree: Codable {
    let header: String
    let tags: [String]
}
