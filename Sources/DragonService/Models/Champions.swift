//
//  Champions.swift
//  dragon-service
//
//  Created by James Glenn on 9/7/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

public struct Champions: Codable {
    public let type, format, version: String
    public let data: [String: ChampionData]
    public let keys: [Int: String]?
}

public struct ChampionData: Codable {
    public let id, key, name, title: String
    public let image: Image
    public let skins: [Skin]?
    public let lore, blurb: String?
    public let allytips, enemytips, tags: [String]?
    public let partype: String?
    public let info: Info
    public let stats: [String: Double]
    public let spells: [Spell]?
    public let passive: Passive?
    public let recommended: [Recommended]?
}

public struct Info: Codable {
    public let attack, defense, magic, difficulty: Int
}

public struct Passive: Codable {
    public let name, description: String
    public let image: Image?
}

public struct Recommended: Codable {
    public let champion, title, map, mode: String
    public let type: String
    public let customTag: String?
    public let sortrank: Int?
    public let extensionPage: Bool?
    public let useObviousCheckmark: Bool?
    public let customPanel: String?
    public let blocks: [Block]
}

public struct Block: Codable {
    public let type: String
    public let recMath, recSteps: Bool?
    public let minSummonerLevel, maxSummonerLevel: Int?
    public let showIfSummonerSpell, hideIfSummonerSpell: String?
    public let appendAfterSection: String?
    public let visibleWithAllOf, hiddenWithAnyOf: [String]?
    public let items: [Item]
}

public struct Item: Codable {
    public let id: String
    public let count: Int
    public let hideCount: Bool?
}

public struct Skin: Codable {
    public let id: String
    public let num: Int?
    public let name: String
    public let chromas: Bool?
}

public struct Spell: Codable {
    public let id, name, description, tooltip: String
    public let leveltip: Leveltip?
    public let maxrank: Int
    public let cooldown: [Double]
    public let cooldownBurn: String
    public let cost: [Int]
    public let costBurn: String
    public let datavalues: Datavalues?
    public let effect: [[Double]?]
    public let effectBurn: [String?]
    public let vars: [VarData]
    public let costType: String
    public let maxammo: String?
    public let range: Range
    public let rangeBurn: String
    public let image: Image
    public let resource: String?
}

public struct VarData: Codable {
    public let link: String?
    public let key: String
    public let coeff: Coeff
}

public struct Datavalues: Codable {
}

