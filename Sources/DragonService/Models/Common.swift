//
//  Common.swift
//  dragon-service
//
//  Created by James Glenn on 9/3/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

struct Image: Codable {
    let full: String
    let sprite: String
    let group: String
    let x, y, w, h: Int
}

struct Basic: Codable {
    let name: String
    let rune: Rune
    let gold: Gold
    let group, description, colloq, plaintext: String
    let consumed: Bool
    let stacks, depth: Int
    let consumeOnFull: Bool
    let from, into: [String]
    let specialRecipe: Int
    let inStore, hideFromAll: Bool
    let requiredChampion: String
    let stats: [String: Int]
    let tags: [String]
    let maps: [String: Bool]
}

struct Gold: Codable {
    let base, total, sell: Int
    let purchasable: Bool
}

struct Rune: Codable {
    let isrune: Bool
    let tier: Int
    let type: String
}

struct Leveltip: Codable {
    let label, effect: [String]
}

enum Coeff: Codable {
    case double(Double)
    case doubleArray([Double])

    init(from decoder: Decoder) throws {
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

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .doubleArray(let x):
            try container.encode(x)
        }
    }
}
