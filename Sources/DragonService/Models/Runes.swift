//
//  Runes.swift
//  dragon-service
//
//  Created by James Glenn on 9/4/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

struct Runes: Codable {
    let type, version: String
    let basic: Basic
    let data: [String: RunesDatum]
}

struct RunesDatum: Codable {
    let name, description: String
    let image: Image
    let rune: DatumRune
    let stats: [String: Double]
    let tags: [Tag]
    let colloq, plaintext: JSONNull?
}

struct DatumRune: Codable {
    let isrune: Bool
    let tier: String
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case black = "black"
    case blue = "blue"
    case red = "red"
    case yellow = "yellow"
}

enum Tag: String, Codable {
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
