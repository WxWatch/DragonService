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
    public let type, version: String
    public let basic: Basic
    public let data: [String: ItemsDatum]
    public let groups: [GroupElement]?
    public let tree: [ItemsTree]?
}

public struct ItemsDatum: Codable {
    public let name, description: String
    public let colloq, plaintext: String?
    public let into: [String?]?
    public let image: Image
    public let gold: Gold
    public let tags: [String]
    public let maps: [String: Bool]?
    public let stats: [String: Double]
    public let from: [String]?
    public let effect: Effect?
    public let depth: Int?
    public let consumed: Bool?
    public let stacks: Int?
    public let inStore, consumeOnFull: Bool?
    public let requiredChampion: String?
    public let specialRecipe: Int?
    public let hideFromAll: Bool?
}

public struct Effect: Codable {
    public let effect1Amount: String?
    public let effect2Amount, effect3Amount, effect4Amount, effect5Amount: String?
    public let effect6Amount, effect7Amount, effect8Amount: String?

    public enum CodingKeys: String, CodingKey {
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
    public let id: String
    public let maxGroupOwnable: String?

    public enum CodingKeys: String, CodingKey {
        case id
        case maxGroupOwnable = "MaxGroupOwnable"
    }
}

public struct ItemsTree: Codable {
    public let header: String
    public let tags: [String]
}
