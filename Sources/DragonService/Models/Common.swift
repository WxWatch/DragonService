//
//  Common.swift
//  dragon-service
//
//  Created by James Glenn on 9/3/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

public struct Image: Codable {
    public let full: String
    public let sprite: String
    public let group: String
    public let x, y, w, h: Int
}

public struct Basic: Codable {
    public let name: String
    public let rune: Rune
    public let gold: Gold
    public let group, description, colloq, plaintext: String
    public let consumed: Bool
    public let stacks, depth: Int
    public let consumeOnFull: Bool
    public let from, into: [String]
    public let specialRecipe: Int
    public let inStore, hideFromAll: Bool
    public let requiredChampion: String
    public let stats: [String: Int]
    public let tags: [String]
    public let maps: [String: Bool]
}

public struct Gold: Codable {
    public let base, total, sell: Int
    public let purchasable: Bool
}

public struct Rune: Codable {
    public let isrune: Bool
    public let tier: Int
    public let type: String
}

public struct Leveltip: Codable {
    public let label, effect: [String]
}

public enum Coeff: Codable {
    case double(Double)
    case doubleArray([Double])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([Double].self) {
            self = .doubleArray(x)
            return
        }
        if let x = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        throw DecodingError.typeMismatch(Coeff.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Coeff"))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .doubleArray(let x):
            try container.encode(x)
        }
    }
}
