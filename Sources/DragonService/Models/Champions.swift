//
//  Champions.swift
//  dragon-service
//
//  Created by James Glenn on 9/7/18.
//  Copyright © 2018 James Glenn. All rights reserved.
//

import Foundation

struct Champions: Codable {
    let type, format, version: String
    let data: [String: ChampionData]
    let keys: [Int: String]?
}

struct ChampionData: Codable {
    let id, key, name, title: String
    let image: Image
    let skins: [Skin]?
    let lore, blurb: String?
    let allytips, enemytips, tags: [String]?
    let partype: String
    let info: Info
    let stats: [String: Double]
    let spells: [Spell]?
    let passive: Passive?
    let recommended: [Recommended]?
}

struct Info: Codable {
    let attack, defense, magic, difficulty: Int
}

struct Passive: Codable {
    let name, description: String
    let image: Image
}

struct Recommended: Codable {
    let champion, title, map, mode: String
    let type: String
    let customTag: String?
    let sortrank: Int?
    let extensionPage: Bool?
    let useObviousCheckmark: Bool?
    let customPanel: String?
    let blocks: [Block]
}

struct Block: Codable {
    let type: String
    let recMath, recSteps: Bool?
    let minSummonerLevel, maxSummonerLevel: Int?
    let showIfSummonerSpell, hideIfSummonerSpell: String?
    let appendAfterSection: String?
    let visibleWithAllOf, hiddenWithAnyOf: [String]?
    let items: [Item]
}

struct Item: Codable {
    let id: String
    let count: Int
    let hideCount: Bool?
}

struct Skin: Codable {
    let id: String
    let num: Int
    let name: String
    let chromas: Bool
}

struct Spell: Codable {
    let id, name, description, tooltip: String
    let leveltip: Leveltip
    let maxrank: Int
    let cooldown: [Double]
    let cooldownBurn: String
    let cost: [Int]
    let costBurn: String
    let datavalues: Datavalues?
    let effect: [[Double]?]
    let effectBurn: [String?]
    let vars: [VarData]
    let costType, maxammo: String
    let range: [Int]
    let rangeBurn: String
    let image: Image
    let resource: String
}

struct VarData: Codable {
    let link: String?
    let key: String
    let coeff: Coeff
}

struct Datavalues: Codable {
}

