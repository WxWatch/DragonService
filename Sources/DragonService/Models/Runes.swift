//
//  Runes.swift
//  dragon-service
//
//  Created by James Glenn on 9/4/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

public struct Runes: Codable {
    public let type, version: String
    public let basic: Basic
    public let data: [String: RunesDatum]
}

public struct RunesDatum: Codable {
    public let name, description: String
    public let image: Image
    public let rune: DatumRune
    public let stats: [String: Double]
    public let tags: [Tag]
    public let colloq, plaintext: JSONNull?
}

public struct DatumRune: Codable {
    public let isrune: Bool
    public let tier: String
    public let type: TypeEnum
}

public enum TypeEnum: String, Codable {
    case black = "black"
    case blue = "blue"
    case red = "red"
    case yellow = "yellow"
}

public enum Tag: String, Codable {
    case defense = "defense"
    case flat = "flat"
    case glyph = "glyph"
    case magic = "magic"
    case mark = "mark"
    case perLevel = "perLevel"
    case percent = "percent"
    case physicalAttack = "physicalAttack"
    case quintessence = "quintessence"
    case seal = "seal"
    case utility = "utility"
}
